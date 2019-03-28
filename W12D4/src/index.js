const DOMNodeCollection = require('./dom_node_collection.js');


window.$l = function (arg1) {
  
  if (arg1 instanceof HTMLElement) {
    return new DOMNodeCollection([arg1]);
  } 

  let elementList = document.querySelectorAll(arg1);
  return new DOMNodeCollection(Array.from(elementList));

};
