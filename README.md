# Functional-language-Interpreter
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
