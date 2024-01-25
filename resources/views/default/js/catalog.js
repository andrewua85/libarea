const favicon = queryAll(".add-favicon");
const statusurl = queryAll(".status");
const screenshot = queryAll(".add-screenshot");

favicon.forEach(el => el.addEventListener("click", () => makeRequest("/web/favicon/add", { body: `id=${el.dataset.id}` })));
screenshot.forEach(el => el.addEventListener("click", () => makeRequest("/web/screenshot/add", { body: `id=${el.dataset.id}` })));
statusurl.forEach(el => el.addEventListener("click", () => makeRequest("/web/status/update")));

// search
isIdEmpty('find-url').onclick = function () {
  getById('find-url').addEventListener('keydown', function () {
    fetchSearchUrl();
  });
}

function fetchSearchUrl() {
  let url = getById("find-url").value;
  if (url.length < 5) return;

  const body = `url=${url}&_token=${token}`;

  fetch("/search/web/url", {
      method: "POST",
      headers: { "Content-Type": "application/x-www-form-urlencoded" },
      body: body,
    })
    .then(response => response.text())
    .then(text => {
      const obj = JSON.parse(text);
      let html = '<div class="flex">';
      for (const key in obj) {
        if (obj[key].item_id) {
          html += `<a class="block green text-sm mt5 mb5" href="/web/website/${obj[key].item_id}">${obj[key].item_url}</a>`;
        }
      }
      html += "</div>";

      if (Object.keys(obj).length !== 0) {
        const items = getById("search_url");
        items.classList.add("block");
        items.innerHTML = html;
      }

      const menu = document.querySelector(".none.block");
      if (menu) {
        document.onclick = function (event) {
          if (!event.target.classList.contains("none.block")) {
            const items = getById("search_url");
            items.classList.remove("block");
          }
        };
      }
    });
}