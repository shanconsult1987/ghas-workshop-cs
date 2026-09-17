/**
 * @name Avoid eval
 * @description Detect use of eval()
 * @kind problem
 * @id py/custom/avoid-eval
 * @problem.severity warning
 */

import python

from Call call
where
  call.getFunc().(Name).getId() = "eval"
select
  call,
  "Avoid eval() because it can execute attacker-controlled code."