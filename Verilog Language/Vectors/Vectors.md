# Verilog中的向量（Vector）详解

## 向量的定义

在Verilog的学习中，我们几乎不得不和成群的量打交道，例如一个8位、16位甚至更多位的量。

```verilog
wire in0, in1, in2, ..., in_31;
```

很显然，写成这样的形式是既不方便也不现实的。为了应对这种情况，向量`Vector`这一概念便出现了。

在向量的加持下，上面的代码可以写成下面这样子。

```verilog
wire [31:0] in;
```

乍一看，向量似乎与其他编程语言中的数组十分相似，但又似乎有哪里不太一样。譬如为什么`[]` 中间包着两个数字？中间的`:`是用来做什么的？

的确，向量与数组十分相似，但其实两者并不完全一样。在Verilog中，两者是不同的东西。

通俗的理解下，`[]` 中的数字，更像是为许许多多单个的量，用从冒号左边的数字，到冒号右边的数字起了一个名字。而既然是起名字，也就不必有什么过多的限制，两个数字可以相同，甚至于负数也能在其中出现，例如下面的例子。

```verilog
wire [0:0] in;
wire [16:-15] out;
```

或许有些人有疑问，上面的例子中，左边的数字总比右边大，是否有什么语法上的要求。其实不然，左边的数字也可以小于右边，但这又涉及到向量的另一个性质。顾名思义，向量是有方向的，定义时，左大右小的向量与左小右大的向量方向不同，而这可能会导致一些问题。于是为了规范和减少错误，一般开发过程中要求所有的向量方向要一致。这是一个规范问题而非语法问题。

最后再以严谨的定义和详细的定义方法收尾。

> Vectors are used to group related signals using one name to make it more convenient to manipulate.

> 向量用一个名字将一些相关的量编为一组，从而使其更方便操作。

```verilog
type [upper:lower] vector_name;

// examples
wire [7:0] w;         // 8-bit wire
reg  [4:1] x;         // 4-bit reg
output reg [0:0] y;   // 1-bit reg that is also an output port (this is still a vector)
input wire [3:-2] z;  // 6-bit wire input (negative ranges are allowed)
output [3:0] a;       // 4-bit output wire. Type is 'wire' unless specified otherwise.
wire [0:7] b;         // 8-bit wire where b[0] is the most-significant bit.
```
