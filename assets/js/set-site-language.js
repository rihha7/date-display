(() => {
  window.addEventListener("DOMContentLoaded", () => {
    const langBtns = document.querySelectorAll("div#lang-btns > a");
    let lang = localStorage.getItem("site-language") ?? "en";
    // 1. set "site-language" in localStorage
    localStorage.setItem("site-language", lang);

    // 2. set the "lang" query param
    const url = new URL(window.location.href);
    url.searchParams.set("lang", lang);
    window.history.replaceState({}, "", url);

    langBtns.forEach(btn => {
      (btn.textContent === lang)
        ? btn.classList.add("bg-black", "pointer-events-none", "border-black", "text-white", "cursor-default")
        : btn.classList.add("hover:bg-[#6d77ee]/50", "hover:border-black");
      
      btn.addEventListener("click", e => {
        // 3. update by setting in localStorage, href="..." will handle query param
        lang = e.currentTarget.textContent;
        localStorage.setItem("site-language", lang);
      });
    });
  });
})();
