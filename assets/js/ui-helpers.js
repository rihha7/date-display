(() => {
  window.addEventListener("DOMContentLoaded", () => {
    const leapYrQuestion = document.getElementById("leap-year-question");
    const text = leapYrQuestion.textContent.match(/[^¿?]+/)?.[0] ?? "";

    const span = document.createElement("span");
    span.classList.add("hover:underline", "underline-offset-3");
    span.textContent = text;

    leapYrQuestion.textContent = leapYrQuestion.textContent.startsWith("¿") ? "¿" : "";

    leapYrQuestion.appendChild(span);
    leapYrQuestion.appendChild(document.createTextNode("?"));
    

    // --------------------------------------------------
    // --------------------------------------------------


    const nextLeap = document.getElementById("next-leap");
    const [nextLeap1, nextLeap2] = nextLeap.textContent.split(/(?<=wird)|(?<=be in)|(?<=será)/);
    const nextLeapYr = nextLeap2.match(/[\d]{4}/)?.[0] ?? "YYYY";
    const [nextLeapYr1, nextLeapYr2] = nextLeap2.split(nextLeapYr);
    
    const strongYear = document.createElement("strong");
    strongYear.appendChild(document.createTextNode(nextLeapYr));

    const br1 = document.createElement("br");
    br1.classList.add("hidden", "max-[560px]:inline");
    
    nextLeap.textContent = nextLeap1;
    nextLeap.appendChild(br1);
    nextLeap.appendChild(document.createTextNode(nextLeapYr1));
    nextLeap.appendChild(strongYear);
    nextLeap.appendChild(document.createTextNode(nextLeapYr2)); // empty string has no append effects, no need for check
    

    // --------------------------------------------------
    // --------------------------------------------------

    const isLeap = document.getElementById("leap-year-info");
    const [isLeap1, isLeap2] = isLeap.textContent.split(/(?<=es un )|(?<=a )|(?<=ein )/);

    const br2 = document.createElement("br");
    br2.classList.add("hidden", "max-[640px]:inline");

    isLeap.textContent = isLeap1;
    isLeap.appendChild(br2);
    isLeap.appendChild(document.createTextNode(isLeap2));
  });
})();
