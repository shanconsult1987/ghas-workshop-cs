/**
 * @name Avoid eval()
 * @description Detects use of Python eval(), which can execute dynamically supplied code.
 * @kind problem
 * @problem.severity warning
 * @precision high
 * @id py/custom/avoid-eval
 */

import python

from Call call
where
  call.getFunc() instanceof Name and
  call.getFunc().(Name).getId() = "eval"
select call, "Avoid eval(); eval() can execute dynamically supplied code."
