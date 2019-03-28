/******/ (function(modules) { // webpackBootstrap
/******/ 	// The module cache
/******/ 	var installedModules = {};
/******/
/******/ 	// The require function
/******/ 	function __webpack_require__(moduleId) {
/******/
/******/ 		// Check if module is in cache
/******/ 		if(installedModules[moduleId]) {
/******/ 			return installedModules[moduleId].exports;
/******/ 		}
/******/ 		// Create a new module (and put it into the cache)
/******/ 		var module = installedModules[moduleId] = {
/******/ 			i: moduleId,
/******/ 			l: false,
/******/ 			exports: {}
/******/ 		};
/******/
/******/ 		// Execute the module function
/******/ 		modules[moduleId].call(module.exports, module, module.exports, __webpack_require__);
/******/
/******/ 		// Flag the module as loaded
/******/ 		module.l = true;
/******/
/******/ 		// Return the exports of the module
/******/ 		return module.exports;
/******/ 	}
/******/
/******/
/******/ 	// expose the modules object (__webpack_modules__)
/******/ 	__webpack_require__.m = modules;
/******/
/******/ 	// expose the module cache
/******/ 	__webpack_require__.c = installedModules;
/******/
/******/ 	// define getter function for harmony exports
/******/ 	__webpack_require__.d = function(exports, name, getter) {
/******/ 		if(!__webpack_require__.o(exports, name)) {
/******/ 			Object.defineProperty(exports, name, { enumerable: true, get: getter });
/******/ 		}
/******/ 	};
/******/
/******/ 	// define __esModule on exports
/******/ 	__webpack_require__.r = function(exports) {
/******/ 		if(typeof Symbol !== 'undefined' && Symbol.toStringTag) {
/******/ 			Object.defineProperty(exports, Symbol.toStringTag, { value: 'Module' });
/******/ 		}
/******/ 		Object.defineProperty(exports, '__esModule', { value: true });
/******/ 	};
/******/
/******/ 	// create a fake namespace object
/******/ 	// mode & 1: value is a module id, require it
/******/ 	// mode & 2: merge all properties of value into the ns
/******/ 	// mode & 4: return value when already ns object
/******/ 	// mode & 8|1: behave like require
/******/ 	__webpack_require__.t = function(value, mode) {
/******/ 		if(mode & 1) value = __webpack_require__(value);
/******/ 		if(mode & 8) return value;
/******/ 		if((mode & 4) && typeof value === 'object' && value && value.__esModule) return value;
/******/ 		var ns = Object.create(null);
/******/ 		__webpack_require__.r(ns);
/******/ 		Object.defineProperty(ns, 'default', { enumerable: true, value: value });
/******/ 		if(mode & 2 && typeof value != 'string') for(var key in value) __webpack_require__.d(ns, key, function(key) { return value[key]; }.bind(null, key));
/******/ 		return ns;
/******/ 	};
/******/
/******/ 	// getDefaultExport function for compatibility with non-harmony modules
/******/ 	__webpack_require__.n = function(module) {
/******/ 		var getter = module && module.__esModule ?
/******/ 			function getDefault() { return module['default']; } :
/******/ 			function getModuleExports() { return module; };
/******/ 		__webpack_require__.d(getter, 'a', getter);
/******/ 		return getter;
/******/ 	};
/******/
/******/ 	// Object.prototype.hasOwnProperty.call
/******/ 	__webpack_require__.o = function(object, property) { return Object.prototype.hasOwnProperty.call(object, property); };
/******/
/******/ 	// __webpack_public_path__
/******/ 	__webpack_require__.p = "";
/******/
/******/
/******/ 	// Load entry module and return exports
/******/ 	return __webpack_require__(__webpack_require__.s = "./src/index.js");
/******/ })
/************************************************************************/
/******/ ({

/***/ "./src/dom_node_collection.js":
/*!************************************!*\
  !*** ./src/dom_node_collection.js ***!
  \************************************/
/*! no static exports found */
/***/ (function(module, exports) {

eval("class DOMNodeCollection {\n\n  constructor(array) {\n    this.elements = array;\n  }\n\n  html(str) {\n    \n    if (typeof str === 'undefined') {\n      return this.elements[0].innerHTML;\n    }  \n\n    this.elements.forEach( (el) => {\n      el.innerHTML = str;\n    });\n    \n  }\n\n  empty() {\n    this.html(\"\");\n  }\n\n  append(El) {\n\n    if (El instanceof DOMNodeCollection ) {\n      debugger;\n      El.elements.forEach(el => {\n        this.elements.forEach(node => {\n          node.innerHTML += el.outerHTML;\n        });\n      });\n    } else {\n      this.elements.forEach( el => {\n        el.innerHTML += (El);\n      });\n    }\n  }  \n\n  attr(attrName, attrValue) {\n    if ( typeof attrValue === 'undefined' ) {\n      this.elements.forEach(el => {\n        return el.getAttribute(attrName);\n      });\n    } else {\n      this.elements.forEach( el => {\n        return el.setAttribute(attrName, attrValue);\n      });\n    }\n  }\n\n  addClass(classValue) {\n    this.attr(\"class\", classValue);\n  }\n\n  removeClass() {\n    this.attr(\"class\", \"\");\n  }\n\n  children() {\n    let children = [];\n    for (let i = 0; i < this.elements.length; i++) {\n      if ( this.elements[i] instanceof DOMNodeCollection) {\n        children = children.concat(this.elements[i].children());\n      } else {\n        children.push(this.elements[i].children);\n      }\n    }\n    return new DOMNodeCollection(children);\n  }\n\n  parent() {\n    let parents = [];\n    for (let i = 0; i < this.elements.length; i++) {\n      if ( this.elements[i] instanceof DOMNodeCollection) {\n        parents = parents.concat(this.elements[i].parent());\n      } else {\n        parents.push(this.elements[i].parentNode);\n      }\n    }\n    return new DOMNodeCollection(parents);\n  };\n\n  remove() {\n    for (let i = 0; i < this.elements.length; i++) {\n      this.elements[i].innerHTML = \"\";\n    }\n  }\n\n  find(selector) {\n    let matches = [];\n        for ( let i = 0; i < this.elements.length; i++ ) {\n          // debugger;\n          matches = matches.concat(Array.from(this.elements[i].querySelectorAll(selector)));\n        }\n    return new DOMNodeCollection(matches);\n  }\n\n  on(type, callback) {\n    this.callBack = callback;\n    for (let i = 0; i < this.elements.length; i++) {\n      this.elements[i].addEventListener(type, callback);\n    }\n  }\n  \n  off(type) {\n    for (let i = 0; i < this.elements.length; i++) {\n      this.elements[i].removeEventListener(type, this.callBack);\n    }\n  }\n\n\n\n\n\n\n}\n\nmodule.exports = DOMNodeCollection;\n\n//# sourceURL=webpack:///./src/dom_node_collection.js?");

/***/ }),

/***/ "./src/index.js":
/*!**********************!*\
  !*** ./src/index.js ***!
  \**********************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

eval("const DOMNodeCollection = __webpack_require__(/*! ./dom_node_collection.js */ \"./src/dom_node_collection.js\");\n\n\nwindow.$l = function (arg1, func) {\n\n  if ( document.readyState === 'complete' ) {\n    func();\n  } \n  \n  let funcArray = [];\n\n  while ( document.readyState != 'complete' ) {\n\n    if (func) {\n      funcArray.push(func);\n    }\n    \n  }\n\n  funcArray.forEach(func => {\n    func();\n  });\n\n  if (arg1 instanceof HTMLElement) {\n    return new DOMNodeCollection([arg1]);\n  }\n\n  let elementList = document.querySelectorAll(arg1);\n  return new DOMNodeCollection(Array.from(elementList));\n\n};\n\n\n//# sourceURL=webpack:///./src/index.js?");

/***/ })

/******/ });