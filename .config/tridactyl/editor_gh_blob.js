tri.native.temp(document.querySelector("textarea.react-blob-print-hide").textContent).then(temp =>
  {
    let newname = `${temp.content}.${window.location.pathname.split("/").pop()}`;
    tri.native.move(temp.content, newname).then(tri.native.editor(newname))
  }
)
