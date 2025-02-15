pragma solidity ^0.5.0;

contract MemberAccess {
    function() {
        a.b.c.d;
        a.b().c.d;
        a.b.c.d();
        a.b().c().d();
        veryLongVariable.veryLongMember.veryLongMember.veryLongMember.veryLongMember.veryLongMember;
        veryLongVariable.veryLongCall(veryLongAttribute).veryLongMember.veryLongMember.veryLongMember;
        veryLongVariable.veryLongMember.veryLongCall(veryLongAttribute).veryLongMember.veryLongMember;
        veryLongVariable.veryLongMember.veryLongMember.veryLongMember.veryLongCall(veryLongAttribute);
        veryLongVariable.veryLongCall(veryLongAttribute).veryLongCall(veryLongAttribute).veryLongCall(veryLongAttribute);
    }
}

contract MemberAccessIsEndOfChainCases {
    // break if is an ReturnStatement
    uint a = b.c;

    function() modifierCase(b.c) {
        // break if is an argument of a FunctionCall
        a(b.c);
        // break if is an index of an IndexAccess
        a[b.c];
        // break if is a part of a BinaryOperation
        a = b.c;
        // break if is a part of a UnaryOperation
        !b.c;
        // break if is a condition of a IfStatement
        if (b.c) {}
        // break if is a condition of a WhileStatement
        while (b.c) {}
        // break if is a part of a ForStatement
        // for (b.c;;) {}
        for (;b.c;) {}
        // for (;;b.c) {}
        // break if is a part of a VariableDeclarationStatement
        uint a = b.c;
        // break if is an ExpressionStatement
        b.c;
        // break if is an TupleExpression
        [a, b.c];
        (b.c);
        // break if is an Conditional
        a.b ? c : d;
        a ? b.c : d;
        a ? b : c.d;
        // break if is an NameValueList
        a.b{value: c.d}();
        // break if is an TryStatement
        try a.b() {} catch {}
        // break if is an ReturnStatement
        return b.c;
    }
}