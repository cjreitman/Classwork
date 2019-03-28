class DOMNodeCollection {

  constructor(array) {
    this.elements = array;
  }

  html(str) {
    
    if (typeof str === 'undefined') {
      return this.elements[0].innerHTML;
    }  

    this.elements.forEach( (el) => {
      el.innerHTML = str;
    });
    
  }

  empty() {
    this.html("");
  }

  append(El) {

    if (El instanceof DOMNodeCollection ) {
      debugger;
      El.elements.forEach(el => {
        this.elements.forEach(node => {
          node.innerHTML += el.outerHTML;
        });
      });
    } else {
      this.elements.forEach( el => {
        el.innerHTML += (El);
      });
    }
  }  

  attr(attrName, attrValue) {
    if ( typeof attrValue === 'undefined' ) {
      this.elements.forEach(el => {
        return el.getAttribute(attrName);
      });
    } else {
      this.elements.forEach( el => {
        return el.setAttribute(attrName, attrValue);
      });
    }
  }

  addClass(classValue) {
    this.attr("class", classValue);
  }

  removeClass() {
    this.attr("class", "");
  }

  children() {
    let children = [];
    for (let i = 0; i < this.elements.length; i++) {
      if ( this.elements[i] instanceof DOMNodeCollection) {
        children = children.concat(this.elements[i].children());
      } else {
        children.push(this.elements[i].children);
      }
    }
    return new DOMNodeCollection(children);
  }

  parent() {
    let parents = [];
    for (let i = 0; i < this.elements.length; i++) {
      if ( this.elements[i] instanceof DOMNodeCollection) {
        parents = parents.concat(this.elements[i].parent());
      } else {
        parents.push(this.elements[i].parentNode);
      }
    }
    return new DOMNodeCollection(parents);
  };

  remove() {
    for (let i = 0; i < this.elements.length; i++) {
      this.elements[i].innerHTML = "";
    }
  }

  find(selector) {
    let matches = [];
        for ( let i = 0; i < this.elements.length; i++ ) {
          // debugger;
          matches = matches.concat(Array.from(this.elements[i].querySelectorAll(selector)));
        }
    return new DOMNodeCollection(matches);
  }

  on(type, callback) {
    this.callBack = callback;
    for (let i = 0; i < this.elements.length; i++) {
      this.elements[i].addEventListener(type, callback);
    }
  }
  
  off(type) {
    for (let i = 0; i < this.elements.length; i++) {
      this.elements[i].removeEventListener(type, this.callBack);
    }
  }






}

module.exports = DOMNodeCollection;