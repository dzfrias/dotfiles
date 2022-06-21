function getElementByXpath(path) {
  // Finds element by xpath
  return document.evaluate(
      path,
      document,
      null,
      XPathResult.FIRST_ORDERED_NODE_TYPE,
      null
  ).singleNodeValue;
}

// Gets anchor tags with h3 elements in them
let searchResult = getElementByXpath('//a/h3/..');
// Redirect to different url
window.location.href = searchResult.href; 
