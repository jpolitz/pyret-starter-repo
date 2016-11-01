import ast as A
import parse-pyret as SP
import file as F

p = SP.surface-parse(F.input-file("test-file.arr").read-file(), "test-file.arr")

# This simple traversal makes every function have return type String
modify-functions = A.default-map-visitor.{
  method s-fun(self, l, name, params, args, _, doc, body, where-block, blocky):
    A.s-fun(
      l,
      name,
      params.map(_.visit(self)),
      args.map(_.visit(self)),
      A.a-name(l, A.s-name(l, "String")),
      doc,
      body.visit(self),
      where-block.and-then(lam(e): e.visit(self) end),
      blocky)
  end
}

modified = p.visit(modify-functions)

as-string = modified.tosource().pretty(80).join-str("\n")

F.output-file("test-file.arr.transformed", false).display(as-string)

