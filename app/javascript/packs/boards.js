const EventEmmiter = {
  events: new Map(),
  addEventListener(event, listener) {
    if (this.events.has(event)) {
      this.events.set(event, [...this.events.get(event), listener]);
    } else {
      this.events.set(event, [listener]);
    }
  },
  emit(event, payload) {
    if (this.events.has(event)) {
      this.events.get(event).forEach((it) => it(payload));
    }
  },
};

EventEmmiter.addEventListener("book-changed", updateBook);

document.addEventListener("turbolinks:load", onLoad);

function onLoad() {
  document.querySelectorAll(".board__item").forEach(function (element) {
    element.ondragstart = onDragStart;
  });

  document.querySelectorAll(".board__list").forEach(function (element) {
    element.ondragover = onDragOver;
    element.ondrop = onDrop;
  });
}

function onDragStart(event) {
  event.dataTransfer.setData("text/plain", event.target.id);
}

function onDragOver(event) {
  event.preventDefault();
}

function onDrop(event) {
  const id = event.dataTransfer.getData("text");

  const element = document.querySelector(`#${id}`);

  const dropzone = this;

  dropzone.appendChild(element);

  event.dataTransfer.clearData();

  EventEmmiter.emit("book-changed", { element: id, dropzone: dropzone });
}

function updateBook(event) {
  const bookId = Number(event.element.replace(/\D/g, ""));

  const status = event.dropzone.dataset.status;

  const token = window._token;

  return getBook(bookId)
    .then((res) => res.json())
    .then((book) => changeStatus(book, status))
    .then((book) => putBook(bookId, book, token));
}

function getBook(id) {
  return fetch(`/books/${id}.json`);
}

function changeStatus(book, status) {
  return {
    title: book.title,
    author: book.author,
    cover: book.cover,
    status,
  };
}

function putBook(id, book, token) {
  return fetch(`/books/${id}`, {
    headers: { "Content-Type": "application/json" },
    method: "PUT",
    body: JSON.stringify({ ...book, authenticity_token: token }),
    redirect: "manual",
  });
}
