const {
  doc: {
    builders: { join, line }
  }
} = require('prettier/standalone');
const { printString } = require('../prettier-comments/common/util');

const StringLiteral = {
  print: ({ node, options }) => {
    const list = node.parts.map(
      (part, index) =>
        // node.isUnicode is an array of the same length as node.parts
        // that indicates if that string fragment has the unicode prefix
        (node.isUnicode[index] ? 'unicode' : '') + printString(part, options)
    );

    return join(line, list);
  }
};

module.exports = StringLiteral;
