# Functional-Language-Interpreter
[![HitCount](http://hits.dwyl.com/Jcl9/Functional-Language-Interpreter.svg)](http://hits.dwyl.com/Jcl9/Functional-Language-Interpreter)

  An interpreter for a simple functional language called PLAN 
# Grammar
〈P rogram〉::= ( prog〈Expr〉)  
〈Expr〉::=〈Id〉  
| 〈Const〉  
|( myignore〈Expr〉)  
|( myadd〈Expr〉 〈Expr〉)  
|( mymul〈Expr〉 〈Expr〉)  
|( myneg〈Expr〉)  
|(mylet〈Id〉 〈Expr〉 〈Expr〉)  
〈Id〉::= a|b|. . .|z  
〈Const〉::= integer constant
# Interpreter Language
* Scheme48
