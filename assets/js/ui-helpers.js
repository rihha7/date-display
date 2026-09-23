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
    const [nextLeap1, nextLeapYr] = nextLeap.textContent.split(/(?<=ist)|(?<=be in)|(?<=será)/);
    
    const strongYear = document.createElement("strong");
    strongYear.appendChild(document.createTextNode(nextLeapYr ?? ""));

    const span1 = document.createElement("span");
    span1.classList.add("hidden", "max-[560px]:block");
    
    nextLeap.textContent = nextLeap1;
    nextLeap.appendChild(span1);
    nextLeap.appendChild(strongYear);
    

    // --------------------------------------------------
    // --------------------------------------------------

    const dateOfCompletion = document.querySelector("time[datetime]");
    const isGerman = dateOfCompletion.parentElement.textContent.startsWith("Abgeschlossen");

    if (isGerman) dateOfCompletion.textContent = dateOfCompletion.textContent.replace(/-/g, ".");
  });
})();
