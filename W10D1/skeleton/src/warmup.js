
const partyHeader = document.getElementById('party');

export const htmlGenerator = (string, htmlElement) => {
  const p = document.createElement("p");
  p.textContent = string;
  if (htmlElement.children.length === 0) htmlElement.append(p);  
  else {    
    htmlElement.firstChild.remove();   // don't do p.remove(); 
    htmlElement.append(p);  
  }  

  // p.textContent = string;
  // while (htmlElement.firstChild) {
  //   htmlElement.firstChild.remove();
  // }

  // htmlElement.append(p);

  //else 
    
  // if (p.textContent === "") htmlElement.append(p);
  // else htmlElement.textContent = string;
};

htmlGenerator('I ♡ Party Time.', partyHeader);

// module.exports = htmlGenerator;