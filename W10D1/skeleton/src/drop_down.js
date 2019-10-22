
const dogs = {
  "Corgi": "https://www.akc.org/dog-breeds/cardigan-welsh-corgi/",
  "Australian Shepherd": "https://www.akc.org/dog-breeds/australian-shepherd/",
  "Affenpinscher": "https://www.akc.org/dog-breeds/affenpinscher/",
  "American Staffordshire Terrier": "https://www.akc.org/dog-breeds/american-staffordshire-terrier/",
  "Tosa": "https://www.akc.org/dog-breeds/tosa/",
  "Labrador Retriever": "https://www.akc.org/dog-breeds/labrador-retriever/",
  "French Bulldog": "https://www.akc.org/dog-breeds/french-bulldog/" 
};


function dogLinkCreator(dogs) {
  const dogsLinks = [];
  
  for (let i=0; i<Object.keys(dogs).length; i++) {
    const a = document.createElement("a");
    a.innerHTML = Object.keys(dogs)[i];
    a.href = Object.values(dogs)[i];    

    const li = document.createElement("li");
    li.className = "dog-link hidden";
    li.append(a);
    dogsLinks.push(li);
  }

  return dogsLinks;
}

function attachDogLinks() {
  const dogLinks = dogLinkCreator(dogs);
  
  const ul = document.querySelector(".drop-down-dog-list");    
  for (let i=0; i<dogLinks.length; i++) {
    ul.append(dogLinks[i]);
  }
}

function handleEnter() {  
  const dogLinks = document.querySelectorAll(".dog-link");  
  dogLinks.forEach(child => child.classList.remove('hidden'));
}

function handleLeave() {  
  const dogLinks = document.querySelectorAll(".dog-link");
  dogLinks.forEach(child => child.classList.add('hidden'));
}





document.addEventListener("DOMContentLoaded", (event) => {
  const dogLinks = document.querySelectorAll(".dog-links");

  attachDogLinks();

  const nav = document.querySelector(".drop-down-dog-nav");

  nav.addEventListener("mouseenter", handleEnter);
  nav.addEventListener("mouseleave", handleLeave);
});

