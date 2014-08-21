library tracing.test;

import 'package:tracing/tracing.dart';
import 'dart:html';
import 'dart:js' show context;

main() {
  detectWTF(context);
  var _main = createScope('main()');
  var _mainCompleted = createInstance('main#Completed');
  var _querySelector = createScope('Node#querySelector()');
  var _DivElement = createScope('DivElement()');
  var _ElementText = createScope('Element#text');
  var _ElementTextSet = createInstance('Element#setText(ascii text)');
  var _NodeAppend = createScope('Node#append()');
  var scope = enter(_main);

  BodyElement body = executeInScope(() {
    return window.document.querySelector('body');
  }, _querySelector);

  var s = enter(_DivElement);
  var div = new DivElement();
  leave(s);

  s = enter(_ElementText);
  div.text = 'Hello WTF! (enabled: ${wtfEnabled})';
  timeStamp1(_ElementTextSet, div.text);
  leave(s);

  s = enter(_NodeAppend);
  body.append(div);
  leave(s);
  leave(scope);

  timeStamp(_mainCompleted);
}
