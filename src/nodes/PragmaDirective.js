const semver = require('semver');

const PragmaDirective = {
  print: ({ node }) => {
    // @TODO: remove hack once solidity-parser-antlr is fixed
    let value = node.value
      .replace(/([<>=])/g, ' $1')
      .replace(/< =/g, '<=')
      .replace(/> =/g, '>=')
      .trim();
    if (value.split(' ').length > 1) {
      value = semver.validRange(value);
    }
    return ['pragma ', node.name, ' ', value, ';'];
  }
};

module.exports = PragmaDirective;
