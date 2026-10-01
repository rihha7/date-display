(() => {
  window.addEventListener("DOMContentLoaded", () => {
    const langBtns = document.querySelectorAll("div#lang-btns > a");
    let lang = localStorage.getItem("site-language") ?? "en";

    // 1. Set "site-language" in localStorage.
    localStorage.setItem("site-language", lang);

    // 2. Set the "lang" query param.
    const url = new URL(window.location.href);
    url.searchParams.set("lang", lang);
    window.history.replaceState({}, "", url);


    langBtns.forEach(btn => {
      (btn.textContent === lang)
        ? btn.classList.add("bg-black", "pointer-events-none", "border-black", "text-white", "cursor-default")
        : btn.classList.add("hover:bg-[#6d77ee]/50", "hover:border-black");
      
      btn.addEventListener("click", e => {
        // 3. Update by re-setting "site-language" in localStorage, href="" handles the query param...
        lang = e.currentTarget.textContent;
        localStorage.setItem("site-language", lang);
      });
    });
  });
})();
