library tracing.test;

import '../lib/tracing.dart';
import 'dart:html';
import 'dart:js' show context;

main() {
  detectWTF(context);
  var _main = createScope('main()');
  var _querySelector = createScope('Node#querySelector()');
  var _DivElement = createScope('DivElement()');
  var _ElementText = createScope('Element#text');
  var _NodeAppend = createScope('Node#append()');
  var scope = enter(_main);
  var s = enter(_querySelector);
  BodyElement body = window.document.querySelector('body');
  leave(s);

  s = enter(_DivElement);
  var div = new DivElement();
  leave(s);

  s = enter(_ElementText);
  div.text = 'Hello WTF! (enabled: ${wtfEnabled})';
  leave(s);

  s = enter(_NodeAppend);
  body.append(div);
  leave(s);
  leave(scope);
}
