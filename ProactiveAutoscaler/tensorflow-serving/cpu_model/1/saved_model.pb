Ł
!ę 
:
Add
x"T
y"T
z"T"
Ttype:
2	
x
Assign
ref"T

value"T

output_ref"T"	
Ttype"
validate_shapebool("
use_lockingbool(
~
BiasAdd

value"T	
bias"T
output"T" 
Ttype:
2	"-
data_formatstringNHWC:
NHWCNCHW
h
ConcatV2
values"T*N
axis"Tidx
output"T"
Nint(0"	
Ttype"
Tidxtype0:
2	
8
Const
output"dtype"
valuetensor"
dtypetype
y
Enter	
data"T
output"T"	
Ttype"

frame_namestring"
is_constantbool( "
parallel_iterationsint

)
Exit	
data"T
output"T"	
Ttype
W

ExpandDims

input"T
dim"Tdim
output"T"	
Ttype"
Tdimtype0:
2	
^
Fill
dims"
index_type

value"T
output"T"	
Ttype"

index_typetype0:
2	
.
Identity

input"T
output"T"	
Ttype
:
Less
x"T
y"T
z
"
Ttype:
2	
$

LogicalAnd
x

y

z

!
LoopCond	
input


output

p
MatMul
a"T
b"T
product"T"
transpose_abool( "
transpose_bbool( "
Ttype:
	2
;
Maximum
x"T
y"T
z"T"
Ttype:

2	
N
Merge
inputs"T*N
output"T
value_index"	
Ttype"
Nint(0
e
MergeV2Checkpoints
checkpoint_prefixes
destination_prefix"
delete_old_dirsbool(
;
Minimum
x"T
y"T
z"T"
Ttype:

2	
=
Mul
x"T
y"T
z"T"
Ttype:
2	
2
NextIteration	
data"T
output"T"	
Ttype

NoOp
M
Pack
values"T*N
output"T"
Nint(0"	
Ttype"
axisint 
ď
ParseExample

serialized	
names
sparse_keys*Nsparse

dense_keys*Ndense
dense_defaults2Tdense
sparse_indices	*Nsparse
sparse_values2sparse_types
sparse_shapes	*Nsparse
dense_values2Tdense"
Nsparseint("
Ndenseint("%
sparse_types
list(type)(:
2	"
Tdense
list(type)(:
2	"
dense_shapeslist(shape)(
C
Placeholder
output"dtype"
dtypetype"
shapeshape:
~
RandomUniform

shape"T
output"dtype"
seedint "
seed2int "
dtypetype:
2"
Ttype:
2	
a
Range
start"Tidx
limit"Tidx
delta"Tidx
output"Tidx"
Tidxtype0:	
2	
D
Relu
features"T
activations"T"
Ttype:
2	
[
Reshape
tensor"T
shape"Tshape
output"T"	
Ttype"
Tshapetype0:
2	
o
	RestoreV2

prefix
tensor_names
shape_and_slices
tensors2dtypes"
dtypes
list(type)(0
l
SaveV2

prefix
tensor_names
shape_and_slices
tensors2dtypes"
dtypes
list(type)(0
P
Shape

input"T
output"out_type"	
Ttype"
out_typetype0:
2	
H
ShardedFilename
basename	
shard

num_shards
filename
ö
StridedSlice

input"T
begin"Index
end"Index
strides"Index
output"T"	
Ttype"
Indextype:
2	"

begin_maskint "
end_maskint "
ellipsis_maskint "
new_axis_maskint "
shrink_axis_maskint 
N

StringJoin
inputs*N

output"
Nint(0"
	separatorstring 
:
Sub
x"T
y"T
z"T"
Ttype:
2	
M
Switch	
data"T
pred

output_false"T
output_true"T"	
Ttype
{
TensorArrayGatherV3

handle
indices
flow_in
value"dtype"
dtypetype"
element_shapeshape:
Y
TensorArrayReadV3

handle	
index
flow_in
value"dtype"
dtypetype
d
TensorArrayScatterV3

handle
indices

value"T
flow_in
flow_out"	
Ttype
9
TensorArraySizeV3

handle
flow_in
size
Ţ
TensorArrayV3
size

handle
flow"
dtypetype"
element_shapeshape:"
dynamic_sizebool( "
clear_after_readbool("$
identical_element_shapesbool( "
tensor_array_namestring 
`
TensorArrayWriteV3

handle	
index

value"T
flow_in
flow_out"	
Ttype
P
	Transpose
x"T
perm"Tperm
y"T"	
Ttype"
Tpermtype0:
2	
s

VariableV2
ref"dtype"
shapeshape"
dtypetype"
	containerstring "
shared_namestring "serve*1.8.02v1.8.0-0-g93bc2e2072Ň

global_step/Initializer/zerosConst*
_class
loc:@global_step*
value	B	 R *
dtype0	*
_output_shapes
: 

global_step
VariableV2*
shared_name *
_class
loc:@global_step*
	container *
shape: *
dtype0	*
_output_shapes
: 
˛
global_step/AssignAssignglobal_stepglobal_step/Initializer/zeros*
use_locking(*
T0	*
_class
loc:@global_step*
validate_shape(*
_output_shapes
: 
j
global_step/readIdentityglobal_step*
T0	*
_class
loc:@global_step*
_output_shapes
: 
o
input_example_tensorPlaceholder*
dtype0*#
_output_shapes
:˙˙˙˙˙˙˙˙˙*
shape:˙˙˙˙˙˙˙˙˙
U
ParseExample/ConstConst*
valueB *
dtype0*
_output_shapes
: 
b
ParseExample/ParseExample/namesConst*
valueB *
dtype0*
_output_shapes
: 
m
&ParseExample/ParseExample/dense_keys_0Const*
valueB Binputs*
dtype0*
_output_shapes
: 
Ą
ParseExample/ParseExampleParseExampleinput_example_tensorParseExample/ParseExample/names&ParseExample/ParseExample/dense_keys_0ParseExample/Const*
Ndense*'
_output_shapes
:˙˙˙˙˙˙˙˙˙*
Nsparse *
dense_shapes
:*
sparse_types
 *
Tdense
2
b
Reshape/shapeConst*
dtype0*
_output_shapes
:*!
valueB"˙˙˙˙      

ReshapeReshapeParseExample/ParseExampleReshape/shape*
T0*
Tshape0*+
_output_shapes
:˙˙˙˙˙˙˙˙˙
R
dynamic_rnn/RankConst*
_output_shapes
: *
value	B :*
dtype0
Y
dynamic_rnn/range/startConst*
value	B :*
dtype0*
_output_shapes
: 
Y
dynamic_rnn/range/deltaConst*
value	B :*
dtype0*
_output_shapes
: 

dynamic_rnn/rangeRangedynamic_rnn/range/startdynamic_rnn/Rankdynamic_rnn/range/delta*
_output_shapes
:*

Tidx0
l
dynamic_rnn/concat/values_0Const*
valueB"       *
dtype0*
_output_shapes
:
Y
dynamic_rnn/concat/axisConst*
dtype0*
_output_shapes
: *
value	B : 
Ą
dynamic_rnn/concatConcatV2dynamic_rnn/concat/values_0dynamic_rnn/rangedynamic_rnn/concat/axis*
N*
_output_shapes
:*

Tidx0*
T0

dynamic_rnn/transpose	TransposeReshapedynamic_rnn/concat*
T0*+
_output_shapes
:˙˙˙˙˙˙˙˙˙*
Tperm0
f
dynamic_rnn/ShapeShapedynamic_rnn/transpose*
out_type0*
_output_shapes
:*
T0
i
dynamic_rnn/strided_slice/stackConst*
valueB:*
dtype0*
_output_shapes
:
k
!dynamic_rnn/strided_slice/stack_1Const*
valueB:*
dtype0*
_output_shapes
:
k
!dynamic_rnn/strided_slice/stack_2Const*
valueB:*
dtype0*
_output_shapes
:
ľ
dynamic_rnn/strided_sliceStridedSlicedynamic_rnn/Shapedynamic_rnn/strided_slice/stack!dynamic_rnn/strided_slice/stack_1!dynamic_rnn/strided_slice/stack_2*
shrink_axis_mask*

begin_mask *
ellipsis_mask *
new_axis_mask *
end_mask *
_output_shapes
: *
T0*
Index0

Fdynamic_rnn/MultiRNNCellZeroState/BasicRNNCellZeroState/ExpandDims/dimConst*
value	B : *
dtype0*
_output_shapes
: 
ä
Bdynamic_rnn/MultiRNNCellZeroState/BasicRNNCellZeroState/ExpandDims
ExpandDimsdynamic_rnn/strided_sliceFdynamic_rnn/MultiRNNCellZeroState/BasicRNNCellZeroState/ExpandDims/dim*
_output_shapes
:*

Tdim0*
T0

=dynamic_rnn/MultiRNNCellZeroState/BasicRNNCellZeroState/ConstConst*
valueB:*
dtype0*
_output_shapes
:

Cdynamic_rnn/MultiRNNCellZeroState/BasicRNNCellZeroState/concat/axisConst*
value	B : *
dtype0*
_output_shapes
: 
Ě
>dynamic_rnn/MultiRNNCellZeroState/BasicRNNCellZeroState/concatConcatV2Bdynamic_rnn/MultiRNNCellZeroState/BasicRNNCellZeroState/ExpandDims=dynamic_rnn/MultiRNNCellZeroState/BasicRNNCellZeroState/ConstCdynamic_rnn/MultiRNNCellZeroState/BasicRNNCellZeroState/concat/axis*
T0*
N*
_output_shapes
:*

Tidx0

Cdynamic_rnn/MultiRNNCellZeroState/BasicRNNCellZeroState/zeros/ConstConst*
valueB
 *    *
dtype0*
_output_shapes
: 

=dynamic_rnn/MultiRNNCellZeroState/BasicRNNCellZeroState/zerosFill>dynamic_rnn/MultiRNNCellZeroState/BasicRNNCellZeroState/concatCdynamic_rnn/MultiRNNCellZeroState/BasicRNNCellZeroState/zeros/Const*
T0*

index_type0*(
_output_shapes
:˙˙˙˙˙˙˙˙˙

Hdynamic_rnn/MultiRNNCellZeroState/BasicRNNCellZeroState/ExpandDims_1/dimConst*
value	B : *
dtype0*
_output_shapes
: 
č
Ddynamic_rnn/MultiRNNCellZeroState/BasicRNNCellZeroState/ExpandDims_1
ExpandDimsdynamic_rnn/strided_sliceHdynamic_rnn/MultiRNNCellZeroState/BasicRNNCellZeroState/ExpandDims_1/dim*
_output_shapes
:*

Tdim0*
T0

?dynamic_rnn/MultiRNNCellZeroState/BasicRNNCellZeroState/Const_1Const*
valueB:*
dtype0*
_output_shapes
:

Hdynamic_rnn/MultiRNNCellZeroState/BasicRNNCellZeroState_1/ExpandDims/dimConst*
dtype0*
_output_shapes
: *
value	B : 
č
Ddynamic_rnn/MultiRNNCellZeroState/BasicRNNCellZeroState_1/ExpandDims
ExpandDimsdynamic_rnn/strided_sliceHdynamic_rnn/MultiRNNCellZeroState/BasicRNNCellZeroState_1/ExpandDims/dim*
T0*
_output_shapes
:*

Tdim0

?dynamic_rnn/MultiRNNCellZeroState/BasicRNNCellZeroState_1/ConstConst*
_output_shapes
:*
valueB:*
dtype0

Edynamic_rnn/MultiRNNCellZeroState/BasicRNNCellZeroState_1/concat/axisConst*
value	B : *
dtype0*
_output_shapes
: 
Ô
@dynamic_rnn/MultiRNNCellZeroState/BasicRNNCellZeroState_1/concatConcatV2Ddynamic_rnn/MultiRNNCellZeroState/BasicRNNCellZeroState_1/ExpandDims?dynamic_rnn/MultiRNNCellZeroState/BasicRNNCellZeroState_1/ConstEdynamic_rnn/MultiRNNCellZeroState/BasicRNNCellZeroState_1/concat/axis*
N*
_output_shapes
:*

Tidx0*
T0

Edynamic_rnn/MultiRNNCellZeroState/BasicRNNCellZeroState_1/zeros/ConstConst*
valueB
 *    *
dtype0*
_output_shapes
: 

?dynamic_rnn/MultiRNNCellZeroState/BasicRNNCellZeroState_1/zerosFill@dynamic_rnn/MultiRNNCellZeroState/BasicRNNCellZeroState_1/concatEdynamic_rnn/MultiRNNCellZeroState/BasicRNNCellZeroState_1/zeros/Const*(
_output_shapes
:˙˙˙˙˙˙˙˙˙*
T0*

index_type0

Jdynamic_rnn/MultiRNNCellZeroState/BasicRNNCellZeroState_1/ExpandDims_1/dimConst*
_output_shapes
: *
value	B : *
dtype0
ě
Fdynamic_rnn/MultiRNNCellZeroState/BasicRNNCellZeroState_1/ExpandDims_1
ExpandDimsdynamic_rnn/strided_sliceJdynamic_rnn/MultiRNNCellZeroState/BasicRNNCellZeroState_1/ExpandDims_1/dim*
_output_shapes
:*

Tdim0*
T0

Adynamic_rnn/MultiRNNCellZeroState/BasicRNNCellZeroState_1/Const_1Const*
valueB:*
dtype0*
_output_shapes
:

Hdynamic_rnn/MultiRNNCellZeroState/BasicRNNCellZeroState_2/ExpandDims/dimConst*
value	B : *
dtype0*
_output_shapes
: 
č
Ddynamic_rnn/MultiRNNCellZeroState/BasicRNNCellZeroState_2/ExpandDims
ExpandDimsdynamic_rnn/strided_sliceHdynamic_rnn/MultiRNNCellZeroState/BasicRNNCellZeroState_2/ExpandDims/dim*
T0*
_output_shapes
:*

Tdim0

?dynamic_rnn/MultiRNNCellZeroState/BasicRNNCellZeroState_2/ConstConst*
dtype0*
_output_shapes
:*
valueB:

Edynamic_rnn/MultiRNNCellZeroState/BasicRNNCellZeroState_2/concat/axisConst*
value	B : *
dtype0*
_output_shapes
: 
Ô
@dynamic_rnn/MultiRNNCellZeroState/BasicRNNCellZeroState_2/concatConcatV2Ddynamic_rnn/MultiRNNCellZeroState/BasicRNNCellZeroState_2/ExpandDims?dynamic_rnn/MultiRNNCellZeroState/BasicRNNCellZeroState_2/ConstEdynamic_rnn/MultiRNNCellZeroState/BasicRNNCellZeroState_2/concat/axis*
T0*
N*
_output_shapes
:*

Tidx0

Edynamic_rnn/MultiRNNCellZeroState/BasicRNNCellZeroState_2/zeros/ConstConst*
valueB
 *    *
dtype0*
_output_shapes
: 

?dynamic_rnn/MultiRNNCellZeroState/BasicRNNCellZeroState_2/zerosFill@dynamic_rnn/MultiRNNCellZeroState/BasicRNNCellZeroState_2/concatEdynamic_rnn/MultiRNNCellZeroState/BasicRNNCellZeroState_2/zeros/Const*
T0*

index_type0*(
_output_shapes
:˙˙˙˙˙˙˙˙˙

Jdynamic_rnn/MultiRNNCellZeroState/BasicRNNCellZeroState_2/ExpandDims_1/dimConst*
dtype0*
_output_shapes
: *
value	B : 
ě
Fdynamic_rnn/MultiRNNCellZeroState/BasicRNNCellZeroState_2/ExpandDims_1
ExpandDimsdynamic_rnn/strided_sliceJdynamic_rnn/MultiRNNCellZeroState/BasicRNNCellZeroState_2/ExpandDims_1/dim*
T0*
_output_shapes
:*

Tdim0

Adynamic_rnn/MultiRNNCellZeroState/BasicRNNCellZeroState_2/Const_1Const*
valueB:*
dtype0*
_output_shapes
:

Hdynamic_rnn/MultiRNNCellZeroState/BasicRNNCellZeroState_3/ExpandDims/dimConst*
value	B : *
dtype0*
_output_shapes
: 
č
Ddynamic_rnn/MultiRNNCellZeroState/BasicRNNCellZeroState_3/ExpandDims
ExpandDimsdynamic_rnn/strided_sliceHdynamic_rnn/MultiRNNCellZeroState/BasicRNNCellZeroState_3/ExpandDims/dim*
_output_shapes
:*

Tdim0*
T0

?dynamic_rnn/MultiRNNCellZeroState/BasicRNNCellZeroState_3/ConstConst*
valueB:*
dtype0*
_output_shapes
:

Edynamic_rnn/MultiRNNCellZeroState/BasicRNNCellZeroState_3/concat/axisConst*
value	B : *
dtype0*
_output_shapes
: 
Ô
@dynamic_rnn/MultiRNNCellZeroState/BasicRNNCellZeroState_3/concatConcatV2Ddynamic_rnn/MultiRNNCellZeroState/BasicRNNCellZeroState_3/ExpandDims?dynamic_rnn/MultiRNNCellZeroState/BasicRNNCellZeroState_3/ConstEdynamic_rnn/MultiRNNCellZeroState/BasicRNNCellZeroState_3/concat/axis*
T0*
N*
_output_shapes
:*

Tidx0

Edynamic_rnn/MultiRNNCellZeroState/BasicRNNCellZeroState_3/zeros/ConstConst*
valueB
 *    *
dtype0*
_output_shapes
: 

?dynamic_rnn/MultiRNNCellZeroState/BasicRNNCellZeroState_3/zerosFill@dynamic_rnn/MultiRNNCellZeroState/BasicRNNCellZeroState_3/concatEdynamic_rnn/MultiRNNCellZeroState/BasicRNNCellZeroState_3/zeros/Const*
T0*

index_type0*(
_output_shapes
:˙˙˙˙˙˙˙˙˙

Jdynamic_rnn/MultiRNNCellZeroState/BasicRNNCellZeroState_3/ExpandDims_1/dimConst*
value	B : *
dtype0*
_output_shapes
: 
ě
Fdynamic_rnn/MultiRNNCellZeroState/BasicRNNCellZeroState_3/ExpandDims_1
ExpandDimsdynamic_rnn/strided_sliceJdynamic_rnn/MultiRNNCellZeroState/BasicRNNCellZeroState_3/ExpandDims_1/dim*
T0*
_output_shapes
:*

Tdim0

Adynamic_rnn/MultiRNNCellZeroState/BasicRNNCellZeroState_3/Const_1Const*
valueB:*
dtype0*
_output_shapes
:

Hdynamic_rnn/MultiRNNCellZeroState/BasicRNNCellZeroState_4/ExpandDims/dimConst*
value	B : *
dtype0*
_output_shapes
: 
č
Ddynamic_rnn/MultiRNNCellZeroState/BasicRNNCellZeroState_4/ExpandDims
ExpandDimsdynamic_rnn/strided_sliceHdynamic_rnn/MultiRNNCellZeroState/BasicRNNCellZeroState_4/ExpandDims/dim*

Tdim0*
T0*
_output_shapes
:

?dynamic_rnn/MultiRNNCellZeroState/BasicRNNCellZeroState_4/ConstConst*
_output_shapes
:*
valueB:*
dtype0

Edynamic_rnn/MultiRNNCellZeroState/BasicRNNCellZeroState_4/concat/axisConst*
_output_shapes
: *
value	B : *
dtype0
Ô
@dynamic_rnn/MultiRNNCellZeroState/BasicRNNCellZeroState_4/concatConcatV2Ddynamic_rnn/MultiRNNCellZeroState/BasicRNNCellZeroState_4/ExpandDims?dynamic_rnn/MultiRNNCellZeroState/BasicRNNCellZeroState_4/ConstEdynamic_rnn/MultiRNNCellZeroState/BasicRNNCellZeroState_4/concat/axis*
N*
_output_shapes
:*

Tidx0*
T0

Edynamic_rnn/MultiRNNCellZeroState/BasicRNNCellZeroState_4/zeros/ConstConst*
valueB
 *    *
dtype0*
_output_shapes
: 

?dynamic_rnn/MultiRNNCellZeroState/BasicRNNCellZeroState_4/zerosFill@dynamic_rnn/MultiRNNCellZeroState/BasicRNNCellZeroState_4/concatEdynamic_rnn/MultiRNNCellZeroState/BasicRNNCellZeroState_4/zeros/Const*

index_type0*(
_output_shapes
:˙˙˙˙˙˙˙˙˙*
T0

Jdynamic_rnn/MultiRNNCellZeroState/BasicRNNCellZeroState_4/ExpandDims_1/dimConst*
_output_shapes
: *
value	B : *
dtype0
ě
Fdynamic_rnn/MultiRNNCellZeroState/BasicRNNCellZeroState_4/ExpandDims_1
ExpandDimsdynamic_rnn/strided_sliceJdynamic_rnn/MultiRNNCellZeroState/BasicRNNCellZeroState_4/ExpandDims_1/dim*
_output_shapes
:*

Tdim0*
T0

Adynamic_rnn/MultiRNNCellZeroState/BasicRNNCellZeroState_4/Const_1Const*
dtype0*
_output_shapes
:*
valueB:
h
dynamic_rnn/Shape_1Shapedynamic_rnn/transpose*
_output_shapes
:*
T0*
out_type0
k
!dynamic_rnn/strided_slice_1/stackConst*
valueB: *
dtype0*
_output_shapes
:
m
#dynamic_rnn/strided_slice_1/stack_1Const*
dtype0*
_output_shapes
:*
valueB:
m
#dynamic_rnn/strided_slice_1/stack_2Const*
valueB:*
dtype0*
_output_shapes
:
ż
dynamic_rnn/strided_slice_1StridedSlicedynamic_rnn/Shape_1!dynamic_rnn/strided_slice_1/stack#dynamic_rnn/strided_slice_1/stack_1#dynamic_rnn/strided_slice_1/stack_2*
shrink_axis_mask*

begin_mask *
ellipsis_mask *
new_axis_mask *
end_mask *
_output_shapes
: *
T0*
Index0
h
dynamic_rnn/Shape_2Shapedynamic_rnn/transpose*
T0*
out_type0*
_output_shapes
:
k
!dynamic_rnn/strided_slice_2/stackConst*
valueB:*
dtype0*
_output_shapes
:
m
#dynamic_rnn/strided_slice_2/stack_1Const*
valueB:*
dtype0*
_output_shapes
:
m
#dynamic_rnn/strided_slice_2/stack_2Const*
valueB:*
dtype0*
_output_shapes
:
ż
dynamic_rnn/strided_slice_2StridedSlicedynamic_rnn/Shape_2!dynamic_rnn/strided_slice_2/stack#dynamic_rnn/strided_slice_2/stack_1#dynamic_rnn/strided_slice_2/stack_2*
end_mask *
_output_shapes
: *
T0*
Index0*
shrink_axis_mask*

begin_mask *
ellipsis_mask *
new_axis_mask 
\
dynamic_rnn/ExpandDims/dimConst*
value	B : *
dtype0*
_output_shapes
: 

dynamic_rnn/ExpandDims
ExpandDimsdynamic_rnn/strided_slice_2dynamic_rnn/ExpandDims/dim*

Tdim0*
T0*
_output_shapes
:
\
dynamic_rnn/ConstConst*
_output_shapes
:*
valueB:*
dtype0
[
dynamic_rnn/concat_1/axisConst*
value	B : *
dtype0*
_output_shapes
: 
 
dynamic_rnn/concat_1ConcatV2dynamic_rnn/ExpandDimsdynamic_rnn/Constdynamic_rnn/concat_1/axis*

Tidx0*
T0*
N*
_output_shapes
:
\
dynamic_rnn/zeros/ConstConst*
valueB
 *    *
dtype0*
_output_shapes
: 

dynamic_rnn/zerosFilldynamic_rnn/concat_1dynamic_rnn/zeros/Const*(
_output_shapes
:˙˙˙˙˙˙˙˙˙*
T0*

index_type0
R
dynamic_rnn/timeConst*
value	B : *
dtype0*
_output_shapes
: 

dynamic_rnn/TensorArrayTensorArrayV3dynamic_rnn/strided_slice_1*
identical_element_shapes(*7
tensor_array_name" dynamic_rnn/dynamic_rnn/output_0*
dtype0*
_output_shapes

:: *%
element_shape:˙˙˙˙˙˙˙˙˙*
dynamic_size( *
clear_after_read(

dynamic_rnn/TensorArray_1TensorArrayV3dynamic_rnn/strided_slice_1*$
element_shape:˙˙˙˙˙˙˙˙˙*
dynamic_size( *
clear_after_read(*
identical_element_shapes(*6
tensor_array_name!dynamic_rnn/dynamic_rnn/input_0*
dtype0*
_output_shapes

:: 
y
$dynamic_rnn/TensorArrayUnstack/ShapeShapedynamic_rnn/transpose*
T0*
out_type0*
_output_shapes
:
|
2dynamic_rnn/TensorArrayUnstack/strided_slice/stackConst*
dtype0*
_output_shapes
:*
valueB: 
~
4dynamic_rnn/TensorArrayUnstack/strided_slice/stack_1Const*
valueB:*
dtype0*
_output_shapes
:
~
4dynamic_rnn/TensorArrayUnstack/strided_slice/stack_2Const*
dtype0*
_output_shapes
:*
valueB:

,dynamic_rnn/TensorArrayUnstack/strided_sliceStridedSlice$dynamic_rnn/TensorArrayUnstack/Shape2dynamic_rnn/TensorArrayUnstack/strided_slice/stack4dynamic_rnn/TensorArrayUnstack/strided_slice/stack_14dynamic_rnn/TensorArrayUnstack/strided_slice/stack_2*
shrink_axis_mask*
ellipsis_mask *

begin_mask *
new_axis_mask *
end_mask *
_output_shapes
: *
T0*
Index0
l
*dynamic_rnn/TensorArrayUnstack/range/startConst*
value	B : *
dtype0*
_output_shapes
: 
l
*dynamic_rnn/TensorArrayUnstack/range/deltaConst*
value	B :*
dtype0*
_output_shapes
: 
ä
$dynamic_rnn/TensorArrayUnstack/rangeRange*dynamic_rnn/TensorArrayUnstack/range/start,dynamic_rnn/TensorArrayUnstack/strided_slice*dynamic_rnn/TensorArrayUnstack/range/delta*

Tidx0*#
_output_shapes
:˙˙˙˙˙˙˙˙˙

Fdynamic_rnn/TensorArrayUnstack/TensorArrayScatter/TensorArrayScatterV3TensorArrayScatterV3dynamic_rnn/TensorArray_1$dynamic_rnn/TensorArrayUnstack/rangedynamic_rnn/transposedynamic_rnn/TensorArray_1:1*
T0*(
_class
loc:@dynamic_rnn/transpose*
_output_shapes
: 
W
dynamic_rnn/Maximum/xConst*
value	B :*
dtype0*
_output_shapes
: 
s
dynamic_rnn/MaximumMaximumdynamic_rnn/Maximum/xdynamic_rnn/strided_slice_1*
_output_shapes
: *
T0
q
dynamic_rnn/MinimumMinimumdynamic_rnn/strided_slice_1dynamic_rnn/Maximum*
_output_shapes
: *
T0
e
#dynamic_rnn/while/iteration_counterConst*
value	B : *
dtype0*
_output_shapes
: 
Ĺ
dynamic_rnn/while/EnterEnter#dynamic_rnn/while/iteration_counter*
_output_shapes
: */

frame_name!dynamic_rnn/while/while_context*
T0*
is_constant( *
parallel_iterations 
´
dynamic_rnn/while/Enter_1Enterdynamic_rnn/time*
T0*
is_constant( *
parallel_iterations *
_output_shapes
: */

frame_name!dynamic_rnn/while/while_context
˝
dynamic_rnn/while/Enter_2Enterdynamic_rnn/TensorArray:1*
T0*
is_constant( *
parallel_iterations *
_output_shapes
: */

frame_name!dynamic_rnn/while/while_context
ó
dynamic_rnn/while/Enter_3Enter=dynamic_rnn/MultiRNNCellZeroState/BasicRNNCellZeroState/zeros*
T0*
is_constant( *
parallel_iterations *(
_output_shapes
:˙˙˙˙˙˙˙˙˙*/

frame_name!dynamic_rnn/while/while_context
ő
dynamic_rnn/while/Enter_4Enter?dynamic_rnn/MultiRNNCellZeroState/BasicRNNCellZeroState_1/zeros*(
_output_shapes
:˙˙˙˙˙˙˙˙˙*/

frame_name!dynamic_rnn/while/while_context*
T0*
is_constant( *
parallel_iterations 
ő
dynamic_rnn/while/Enter_5Enter?dynamic_rnn/MultiRNNCellZeroState/BasicRNNCellZeroState_2/zeros*
is_constant( *
parallel_iterations *(
_output_shapes
:˙˙˙˙˙˙˙˙˙*/

frame_name!dynamic_rnn/while/while_context*
T0
ő
dynamic_rnn/while/Enter_6Enter?dynamic_rnn/MultiRNNCellZeroState/BasicRNNCellZeroState_3/zeros*
parallel_iterations *(
_output_shapes
:˙˙˙˙˙˙˙˙˙*/

frame_name!dynamic_rnn/while/while_context*
T0*
is_constant( 
ő
dynamic_rnn/while/Enter_7Enter?dynamic_rnn/MultiRNNCellZeroState/BasicRNNCellZeroState_4/zeros*
T0*
is_constant( *
parallel_iterations *(
_output_shapes
:˙˙˙˙˙˙˙˙˙*/

frame_name!dynamic_rnn/while/while_context

dynamic_rnn/while/MergeMergedynamic_rnn/while/Enterdynamic_rnn/while/NextIteration*
_output_shapes
: : *
T0*
N

dynamic_rnn/while/Merge_1Mergedynamic_rnn/while/Enter_1!dynamic_rnn/while/NextIteration_1*
T0*
N*
_output_shapes
: : 

dynamic_rnn/while/Merge_2Mergedynamic_rnn/while/Enter_2!dynamic_rnn/while/NextIteration_2*
N*
_output_shapes
: : *
T0

dynamic_rnn/while/Merge_3Mergedynamic_rnn/while/Enter_3!dynamic_rnn/while/NextIteration_3*
N**
_output_shapes
:˙˙˙˙˙˙˙˙˙: *
T0

dynamic_rnn/while/Merge_4Mergedynamic_rnn/while/Enter_4!dynamic_rnn/while/NextIteration_4*
T0*
N**
_output_shapes
:˙˙˙˙˙˙˙˙˙: 

dynamic_rnn/while/Merge_5Mergedynamic_rnn/while/Enter_5!dynamic_rnn/while/NextIteration_5*
T0*
N**
_output_shapes
:˙˙˙˙˙˙˙˙˙: 

dynamic_rnn/while/Merge_6Mergedynamic_rnn/while/Enter_6!dynamic_rnn/while/NextIteration_6*
T0*
N**
_output_shapes
:˙˙˙˙˙˙˙˙˙: 

dynamic_rnn/while/Merge_7Mergedynamic_rnn/while/Enter_7!dynamic_rnn/while/NextIteration_7*
N**
_output_shapes
:˙˙˙˙˙˙˙˙˙: *
T0
v
dynamic_rnn/while/LessLessdynamic_rnn/while/Mergedynamic_rnn/while/Less/Enter*
_output_shapes
: *
T0
Â
dynamic_rnn/while/Less/EnterEnterdynamic_rnn/strided_slice_1*
T0*
is_constant(*
parallel_iterations *
_output_shapes
: */

frame_name!dynamic_rnn/while/while_context
|
dynamic_rnn/while/Less_1Lessdynamic_rnn/while/Merge_1dynamic_rnn/while/Less_1/Enter*
_output_shapes
: *
T0
ź
dynamic_rnn/while/Less_1/EnterEnterdynamic_rnn/Minimum*
_output_shapes
: */

frame_name!dynamic_rnn/while/while_context*
T0*
is_constant(*
parallel_iterations 
t
dynamic_rnn/while/LogicalAnd
LogicalAnddynamic_rnn/while/Lessdynamic_rnn/while/Less_1*
_output_shapes
: 
\
dynamic_rnn/while/LoopCondLoopConddynamic_rnn/while/LogicalAnd*
_output_shapes
: 
Ś
dynamic_rnn/while/SwitchSwitchdynamic_rnn/while/Mergedynamic_rnn/while/LoopCond*
T0**
_class 
loc:@dynamic_rnn/while/Merge*
_output_shapes
: : 
Ź
dynamic_rnn/while/Switch_1Switchdynamic_rnn/while/Merge_1dynamic_rnn/while/LoopCond*
T0*,
_class"
 loc:@dynamic_rnn/while/Merge_1*
_output_shapes
: : 
Ź
dynamic_rnn/while/Switch_2Switchdynamic_rnn/while/Merge_2dynamic_rnn/while/LoopCond*
_output_shapes
: : *
T0*,
_class"
 loc:@dynamic_rnn/while/Merge_2
Đ
dynamic_rnn/while/Switch_3Switchdynamic_rnn/while/Merge_3dynamic_rnn/while/LoopCond*
T0*,
_class"
 loc:@dynamic_rnn/while/Merge_3*<
_output_shapes*
(:˙˙˙˙˙˙˙˙˙:˙˙˙˙˙˙˙˙˙
Đ
dynamic_rnn/while/Switch_4Switchdynamic_rnn/while/Merge_4dynamic_rnn/while/LoopCond*
T0*,
_class"
 loc:@dynamic_rnn/while/Merge_4*<
_output_shapes*
(:˙˙˙˙˙˙˙˙˙:˙˙˙˙˙˙˙˙˙
Đ
dynamic_rnn/while/Switch_5Switchdynamic_rnn/while/Merge_5dynamic_rnn/while/LoopCond*
T0*,
_class"
 loc:@dynamic_rnn/while/Merge_5*<
_output_shapes*
(:˙˙˙˙˙˙˙˙˙:˙˙˙˙˙˙˙˙˙
Đ
dynamic_rnn/while/Switch_6Switchdynamic_rnn/while/Merge_6dynamic_rnn/while/LoopCond*,
_class"
 loc:@dynamic_rnn/while/Merge_6*<
_output_shapes*
(:˙˙˙˙˙˙˙˙˙:˙˙˙˙˙˙˙˙˙*
T0
Đ
dynamic_rnn/while/Switch_7Switchdynamic_rnn/while/Merge_7dynamic_rnn/while/LoopCond*<
_output_shapes*
(:˙˙˙˙˙˙˙˙˙:˙˙˙˙˙˙˙˙˙*
T0*,
_class"
 loc:@dynamic_rnn/while/Merge_7
c
dynamic_rnn/while/IdentityIdentitydynamic_rnn/while/Switch:1*
_output_shapes
: *
T0
g
dynamic_rnn/while/Identity_1Identitydynamic_rnn/while/Switch_1:1*
T0*
_output_shapes
: 
g
dynamic_rnn/while/Identity_2Identitydynamic_rnn/while/Switch_2:1*
T0*
_output_shapes
: 
y
dynamic_rnn/while/Identity_3Identitydynamic_rnn/while/Switch_3:1*
T0*(
_output_shapes
:˙˙˙˙˙˙˙˙˙
y
dynamic_rnn/while/Identity_4Identitydynamic_rnn/while/Switch_4:1*(
_output_shapes
:˙˙˙˙˙˙˙˙˙*
T0
y
dynamic_rnn/while/Identity_5Identitydynamic_rnn/while/Switch_5:1*
T0*(
_output_shapes
:˙˙˙˙˙˙˙˙˙
y
dynamic_rnn/while/Identity_6Identitydynamic_rnn/while/Switch_6:1*(
_output_shapes
:˙˙˙˙˙˙˙˙˙*
T0
y
dynamic_rnn/while/Identity_7Identitydynamic_rnn/while/Switch_7:1*(
_output_shapes
:˙˙˙˙˙˙˙˙˙*
T0
v
dynamic_rnn/while/add/yConst^dynamic_rnn/while/Identity*
_output_shapes
: *
value	B :*
dtype0
r
dynamic_rnn/while/addAdddynamic_rnn/while/Identitydynamic_rnn/while/add/y*
T0*
_output_shapes
: 
ä
#dynamic_rnn/while/TensorArrayReadV3TensorArrayReadV3)dynamic_rnn/while/TensorArrayReadV3/Enterdynamic_rnn/while/Identity_1+dynamic_rnn/while/TensorArrayReadV3/Enter_1*
dtype0*'
_output_shapes
:˙˙˙˙˙˙˙˙˙
Ń
)dynamic_rnn/while/TensorArrayReadV3/EnterEnterdynamic_rnn/TensorArray_1*
is_constant(*
parallel_iterations *
_output_shapes
:*/

frame_name!dynamic_rnn/while/while_context*
T0
ü
+dynamic_rnn/while/TensorArrayReadV3/Enter_1EnterFdynamic_rnn/TensorArrayUnstack/TensorArrayScatter/TensorArrayScatterV3*
_output_shapes
: */

frame_name!dynamic_rnn/while/while_context*
T0*
is_constant(*
parallel_iterations 
ő
Xdynamic_rnn/multi_rnn_cell/cell_0/basic_rnn_cell/kernel/Initializer/random_uniform/shapeConst*
dtype0*
_output_shapes
:*J
_class@
><loc:@dynamic_rnn/multi_rnn_cell/cell_0/basic_rnn_cell/kernel*
valueB"     
ç
Vdynamic_rnn/multi_rnn_cell/cell_0/basic_rnn_cell/kernel/Initializer/random_uniform/minConst*J
_class@
><loc:@dynamic_rnn/multi_rnn_cell/cell_0/basic_rnn_cell/kernel*
valueB
 *|Ý˝*
dtype0*
_output_shapes
: 
ç
Vdynamic_rnn/multi_rnn_cell/cell_0/basic_rnn_cell/kernel/Initializer/random_uniform/maxConst*J
_class@
><loc:@dynamic_rnn/multi_rnn_cell/cell_0/basic_rnn_cell/kernel*
valueB
 *|Ý=*
dtype0*
_output_shapes
: 
č
`dynamic_rnn/multi_rnn_cell/cell_0/basic_rnn_cell/kernel/Initializer/random_uniform/RandomUniformRandomUniformXdynamic_rnn/multi_rnn_cell/cell_0/basic_rnn_cell/kernel/Initializer/random_uniform/shape*
dtype0* 
_output_shapes
:
*

seed *
T0*J
_class@
><loc:@dynamic_rnn/multi_rnn_cell/cell_0/basic_rnn_cell/kernel*
seed2 
ú
Vdynamic_rnn/multi_rnn_cell/cell_0/basic_rnn_cell/kernel/Initializer/random_uniform/subSubVdynamic_rnn/multi_rnn_cell/cell_0/basic_rnn_cell/kernel/Initializer/random_uniform/maxVdynamic_rnn/multi_rnn_cell/cell_0/basic_rnn_cell/kernel/Initializer/random_uniform/min*
T0*J
_class@
><loc:@dynamic_rnn/multi_rnn_cell/cell_0/basic_rnn_cell/kernel*
_output_shapes
: 

Vdynamic_rnn/multi_rnn_cell/cell_0/basic_rnn_cell/kernel/Initializer/random_uniform/mulMul`dynamic_rnn/multi_rnn_cell/cell_0/basic_rnn_cell/kernel/Initializer/random_uniform/RandomUniformVdynamic_rnn/multi_rnn_cell/cell_0/basic_rnn_cell/kernel/Initializer/random_uniform/sub*
T0*J
_class@
><loc:@dynamic_rnn/multi_rnn_cell/cell_0/basic_rnn_cell/kernel* 
_output_shapes
:


Rdynamic_rnn/multi_rnn_cell/cell_0/basic_rnn_cell/kernel/Initializer/random_uniformAddVdynamic_rnn/multi_rnn_cell/cell_0/basic_rnn_cell/kernel/Initializer/random_uniform/mulVdynamic_rnn/multi_rnn_cell/cell_0/basic_rnn_cell/kernel/Initializer/random_uniform/min*J
_class@
><loc:@dynamic_rnn/multi_rnn_cell/cell_0/basic_rnn_cell/kernel* 
_output_shapes
:
*
T0
ű
7dynamic_rnn/multi_rnn_cell/cell_0/basic_rnn_cell/kernel
VariableV2* 
_output_shapes
:
*
shared_name *J
_class@
><loc:@dynamic_rnn/multi_rnn_cell/cell_0/basic_rnn_cell/kernel*
	container *
shape:
*
dtype0
ő
>dynamic_rnn/multi_rnn_cell/cell_0/basic_rnn_cell/kernel/AssignAssign7dynamic_rnn/multi_rnn_cell/cell_0/basic_rnn_cell/kernelRdynamic_rnn/multi_rnn_cell/cell_0/basic_rnn_cell/kernel/Initializer/random_uniform* 
_output_shapes
:
*
use_locking(*
T0*J
_class@
><loc:@dynamic_rnn/multi_rnn_cell/cell_0/basic_rnn_cell/kernel*
validate_shape(
Ź
<dynamic_rnn/multi_rnn_cell/cell_0/basic_rnn_cell/kernel/readIdentity7dynamic_rnn/multi_rnn_cell/cell_0/basic_rnn_cell/kernel* 
_output_shapes
:
*
T0
ŕ
Gdynamic_rnn/multi_rnn_cell/cell_0/basic_rnn_cell/bias/Initializer/zerosConst*H
_class>
<:loc:@dynamic_rnn/multi_rnn_cell/cell_0/basic_rnn_cell/bias*
valueB*    *
dtype0*
_output_shapes	
:
í
5dynamic_rnn/multi_rnn_cell/cell_0/basic_rnn_cell/bias
VariableV2*
shared_name *H
_class>
<:loc:@dynamic_rnn/multi_rnn_cell/cell_0/basic_rnn_cell/bias*
	container *
shape:*
dtype0*
_output_shapes	
:
ß
<dynamic_rnn/multi_rnn_cell/cell_0/basic_rnn_cell/bias/AssignAssign5dynamic_rnn/multi_rnn_cell/cell_0/basic_rnn_cell/biasGdynamic_rnn/multi_rnn_cell/cell_0/basic_rnn_cell/bias/Initializer/zeros*
use_locking(*
T0*H
_class>
<:loc:@dynamic_rnn/multi_rnn_cell/cell_0/basic_rnn_cell/bias*
validate_shape(*
_output_shapes	
:
Ł
:dynamic_rnn/multi_rnn_cell/cell_0/basic_rnn_cell/bias/readIdentity5dynamic_rnn/multi_rnn_cell/cell_0/basic_rnn_cell/bias*
T0*
_output_shapes	
:
­
Ndynamic_rnn/while/dynamic_rnn/multi_rnn_cell/cell_0/basic_rnn_cell/concat/axisConst^dynamic_rnn/while/Identity*
dtype0*
_output_shapes
: *
value	B :
°
Idynamic_rnn/while/dynamic_rnn/multi_rnn_cell/cell_0/basic_rnn_cell/concatConcatV2#dynamic_rnn/while/TensorArrayReadV3dynamic_rnn/while/Identity_3Ndynamic_rnn/while/dynamic_rnn/multi_rnn_cell/cell_0/basic_rnn_cell/concat/axis*
T0*
N*(
_output_shapes
:˙˙˙˙˙˙˙˙˙*

Tidx0
Č
Idynamic_rnn/while/dynamic_rnn/multi_rnn_cell/cell_0/basic_rnn_cell/MatMulMatMulIdynamic_rnn/while/dynamic_rnn/multi_rnn_cell/cell_0/basic_rnn_cell/concatOdynamic_rnn/while/dynamic_rnn/multi_rnn_cell/cell_0/basic_rnn_cell/MatMul/Enter*
T0*(
_output_shapes
:˙˙˙˙˙˙˙˙˙*
transpose_a( *
transpose_b( 
 
Odynamic_rnn/while/dynamic_rnn/multi_rnn_cell/cell_0/basic_rnn_cell/MatMul/EnterEnter<dynamic_rnn/multi_rnn_cell/cell_0/basic_rnn_cell/kernel/read*
T0*
is_constant(*
parallel_iterations * 
_output_shapes
:
*/

frame_name!dynamic_rnn/while/while_context
ź
Jdynamic_rnn/while/dynamic_rnn/multi_rnn_cell/cell_0/basic_rnn_cell/BiasAddBiasAddIdynamic_rnn/while/dynamic_rnn/multi_rnn_cell/cell_0/basic_rnn_cell/MatMulPdynamic_rnn/while/dynamic_rnn/multi_rnn_cell/cell_0/basic_rnn_cell/BiasAdd/Enter*
T0*
data_formatNHWC*(
_output_shapes
:˙˙˙˙˙˙˙˙˙

Pdynamic_rnn/while/dynamic_rnn/multi_rnn_cell/cell_0/basic_rnn_cell/BiasAdd/EnterEnter:dynamic_rnn/multi_rnn_cell/cell_0/basic_rnn_cell/bias/read*
T0*
is_constant(*
parallel_iterations *
_output_shapes	
:*/

frame_name!dynamic_rnn/while/while_context
Î
Gdynamic_rnn/while/dynamic_rnn/multi_rnn_cell/cell_0/basic_rnn_cell/ReluReluJdynamic_rnn/while/dynamic_rnn/multi_rnn_cell/cell_0/basic_rnn_cell/BiasAdd*
T0*(
_output_shapes
:˙˙˙˙˙˙˙˙˙
ő
Xdynamic_rnn/multi_rnn_cell/cell_1/basic_rnn_cell/kernel/Initializer/random_uniform/shapeConst*
_output_shapes
:*J
_class@
><loc:@dynamic_rnn/multi_rnn_cell/cell_1/basic_rnn_cell/kernel*
valueB"      *
dtype0
ç
Vdynamic_rnn/multi_rnn_cell/cell_1/basic_rnn_cell/kernel/Initializer/random_uniform/minConst*J
_class@
><loc:@dynamic_rnn/multi_rnn_cell/cell_1/basic_rnn_cell/kernel*
valueB
 *óľ˝*
dtype0*
_output_shapes
: 
ç
Vdynamic_rnn/multi_rnn_cell/cell_1/basic_rnn_cell/kernel/Initializer/random_uniform/maxConst*
_output_shapes
: *J
_class@
><loc:@dynamic_rnn/multi_rnn_cell/cell_1/basic_rnn_cell/kernel*
valueB
 *óľ=*
dtype0
č
`dynamic_rnn/multi_rnn_cell/cell_1/basic_rnn_cell/kernel/Initializer/random_uniform/RandomUniformRandomUniformXdynamic_rnn/multi_rnn_cell/cell_1/basic_rnn_cell/kernel/Initializer/random_uniform/shape*
dtype0* 
_output_shapes
:
*

seed *
T0*J
_class@
><loc:@dynamic_rnn/multi_rnn_cell/cell_1/basic_rnn_cell/kernel*
seed2 
ú
Vdynamic_rnn/multi_rnn_cell/cell_1/basic_rnn_cell/kernel/Initializer/random_uniform/subSubVdynamic_rnn/multi_rnn_cell/cell_1/basic_rnn_cell/kernel/Initializer/random_uniform/maxVdynamic_rnn/multi_rnn_cell/cell_1/basic_rnn_cell/kernel/Initializer/random_uniform/min*
T0*J
_class@
><loc:@dynamic_rnn/multi_rnn_cell/cell_1/basic_rnn_cell/kernel*
_output_shapes
: 

Vdynamic_rnn/multi_rnn_cell/cell_1/basic_rnn_cell/kernel/Initializer/random_uniform/mulMul`dynamic_rnn/multi_rnn_cell/cell_1/basic_rnn_cell/kernel/Initializer/random_uniform/RandomUniformVdynamic_rnn/multi_rnn_cell/cell_1/basic_rnn_cell/kernel/Initializer/random_uniform/sub*
T0*J
_class@
><loc:@dynamic_rnn/multi_rnn_cell/cell_1/basic_rnn_cell/kernel* 
_output_shapes
:


Rdynamic_rnn/multi_rnn_cell/cell_1/basic_rnn_cell/kernel/Initializer/random_uniformAddVdynamic_rnn/multi_rnn_cell/cell_1/basic_rnn_cell/kernel/Initializer/random_uniform/mulVdynamic_rnn/multi_rnn_cell/cell_1/basic_rnn_cell/kernel/Initializer/random_uniform/min* 
_output_shapes
:
*
T0*J
_class@
><loc:@dynamic_rnn/multi_rnn_cell/cell_1/basic_rnn_cell/kernel
ű
7dynamic_rnn/multi_rnn_cell/cell_1/basic_rnn_cell/kernel
VariableV2*J
_class@
><loc:@dynamic_rnn/multi_rnn_cell/cell_1/basic_rnn_cell/kernel*
	container *
shape:
*
dtype0* 
_output_shapes
:
*
shared_name 
ő
>dynamic_rnn/multi_rnn_cell/cell_1/basic_rnn_cell/kernel/AssignAssign7dynamic_rnn/multi_rnn_cell/cell_1/basic_rnn_cell/kernelRdynamic_rnn/multi_rnn_cell/cell_1/basic_rnn_cell/kernel/Initializer/random_uniform*
use_locking(*
T0*J
_class@
><loc:@dynamic_rnn/multi_rnn_cell/cell_1/basic_rnn_cell/kernel*
validate_shape(* 
_output_shapes
:

Ź
<dynamic_rnn/multi_rnn_cell/cell_1/basic_rnn_cell/kernel/readIdentity7dynamic_rnn/multi_rnn_cell/cell_1/basic_rnn_cell/kernel*
T0* 
_output_shapes
:

ŕ
Gdynamic_rnn/multi_rnn_cell/cell_1/basic_rnn_cell/bias/Initializer/zerosConst*H
_class>
<:loc:@dynamic_rnn/multi_rnn_cell/cell_1/basic_rnn_cell/bias*
valueB*    *
dtype0*
_output_shapes	
:
í
5dynamic_rnn/multi_rnn_cell/cell_1/basic_rnn_cell/bias
VariableV2*
shape:*
dtype0*
_output_shapes	
:*
shared_name *H
_class>
<:loc:@dynamic_rnn/multi_rnn_cell/cell_1/basic_rnn_cell/bias*
	container 
ß
<dynamic_rnn/multi_rnn_cell/cell_1/basic_rnn_cell/bias/AssignAssign5dynamic_rnn/multi_rnn_cell/cell_1/basic_rnn_cell/biasGdynamic_rnn/multi_rnn_cell/cell_1/basic_rnn_cell/bias/Initializer/zeros*
T0*H
_class>
<:loc:@dynamic_rnn/multi_rnn_cell/cell_1/basic_rnn_cell/bias*
validate_shape(*
_output_shapes	
:*
use_locking(
Ł
:dynamic_rnn/multi_rnn_cell/cell_1/basic_rnn_cell/bias/readIdentity5dynamic_rnn/multi_rnn_cell/cell_1/basic_rnn_cell/bias*
_output_shapes	
:*
T0
­
Ndynamic_rnn/while/dynamic_rnn/multi_rnn_cell/cell_1/basic_rnn_cell/concat/axisConst^dynamic_rnn/while/Identity*
value	B :*
dtype0*
_output_shapes
: 
Ô
Idynamic_rnn/while/dynamic_rnn/multi_rnn_cell/cell_1/basic_rnn_cell/concatConcatV2Gdynamic_rnn/while/dynamic_rnn/multi_rnn_cell/cell_0/basic_rnn_cell/Reludynamic_rnn/while/Identity_4Ndynamic_rnn/while/dynamic_rnn/multi_rnn_cell/cell_1/basic_rnn_cell/concat/axis*
N*(
_output_shapes
:˙˙˙˙˙˙˙˙˙*

Tidx0*
T0
Č
Idynamic_rnn/while/dynamic_rnn/multi_rnn_cell/cell_1/basic_rnn_cell/MatMulMatMulIdynamic_rnn/while/dynamic_rnn/multi_rnn_cell/cell_1/basic_rnn_cell/concatOdynamic_rnn/while/dynamic_rnn/multi_rnn_cell/cell_1/basic_rnn_cell/MatMul/Enter*
transpose_b( *
T0*(
_output_shapes
:˙˙˙˙˙˙˙˙˙*
transpose_a( 
 
Odynamic_rnn/while/dynamic_rnn/multi_rnn_cell/cell_1/basic_rnn_cell/MatMul/EnterEnter<dynamic_rnn/multi_rnn_cell/cell_1/basic_rnn_cell/kernel/read*
parallel_iterations * 
_output_shapes
:
*/

frame_name!dynamic_rnn/while/while_context*
T0*
is_constant(
ź
Jdynamic_rnn/while/dynamic_rnn/multi_rnn_cell/cell_1/basic_rnn_cell/BiasAddBiasAddIdynamic_rnn/while/dynamic_rnn/multi_rnn_cell/cell_1/basic_rnn_cell/MatMulPdynamic_rnn/while/dynamic_rnn/multi_rnn_cell/cell_1/basic_rnn_cell/BiasAdd/Enter*
T0*
data_formatNHWC*(
_output_shapes
:˙˙˙˙˙˙˙˙˙

Pdynamic_rnn/while/dynamic_rnn/multi_rnn_cell/cell_1/basic_rnn_cell/BiasAdd/EnterEnter:dynamic_rnn/multi_rnn_cell/cell_1/basic_rnn_cell/bias/read*
T0*
is_constant(*
parallel_iterations *
_output_shapes	
:*/

frame_name!dynamic_rnn/while/while_context
Î
Gdynamic_rnn/while/dynamic_rnn/multi_rnn_cell/cell_1/basic_rnn_cell/ReluReluJdynamic_rnn/while/dynamic_rnn/multi_rnn_cell/cell_1/basic_rnn_cell/BiasAdd*
T0*(
_output_shapes
:˙˙˙˙˙˙˙˙˙
ő
Xdynamic_rnn/multi_rnn_cell/cell_2/basic_rnn_cell/kernel/Initializer/random_uniform/shapeConst*J
_class@
><loc:@dynamic_rnn/multi_rnn_cell/cell_2/basic_rnn_cell/kernel*
valueB"      *
dtype0*
_output_shapes
:
ç
Vdynamic_rnn/multi_rnn_cell/cell_2/basic_rnn_cell/kernel/Initializer/random_uniform/minConst*J
_class@
><loc:@dynamic_rnn/multi_rnn_cell/cell_2/basic_rnn_cell/kernel*
valueB
 *óľ˝*
dtype0*
_output_shapes
: 
ç
Vdynamic_rnn/multi_rnn_cell/cell_2/basic_rnn_cell/kernel/Initializer/random_uniform/maxConst*
_output_shapes
: *J
_class@
><loc:@dynamic_rnn/multi_rnn_cell/cell_2/basic_rnn_cell/kernel*
valueB
 *óľ=*
dtype0
č
`dynamic_rnn/multi_rnn_cell/cell_2/basic_rnn_cell/kernel/Initializer/random_uniform/RandomUniformRandomUniformXdynamic_rnn/multi_rnn_cell/cell_2/basic_rnn_cell/kernel/Initializer/random_uniform/shape*
T0*J
_class@
><loc:@dynamic_rnn/multi_rnn_cell/cell_2/basic_rnn_cell/kernel*
seed2 *
dtype0* 
_output_shapes
:
*

seed 
ú
Vdynamic_rnn/multi_rnn_cell/cell_2/basic_rnn_cell/kernel/Initializer/random_uniform/subSubVdynamic_rnn/multi_rnn_cell/cell_2/basic_rnn_cell/kernel/Initializer/random_uniform/maxVdynamic_rnn/multi_rnn_cell/cell_2/basic_rnn_cell/kernel/Initializer/random_uniform/min*
T0*J
_class@
><loc:@dynamic_rnn/multi_rnn_cell/cell_2/basic_rnn_cell/kernel*
_output_shapes
: 

Vdynamic_rnn/multi_rnn_cell/cell_2/basic_rnn_cell/kernel/Initializer/random_uniform/mulMul`dynamic_rnn/multi_rnn_cell/cell_2/basic_rnn_cell/kernel/Initializer/random_uniform/RandomUniformVdynamic_rnn/multi_rnn_cell/cell_2/basic_rnn_cell/kernel/Initializer/random_uniform/sub*
T0*J
_class@
><loc:@dynamic_rnn/multi_rnn_cell/cell_2/basic_rnn_cell/kernel* 
_output_shapes
:


Rdynamic_rnn/multi_rnn_cell/cell_2/basic_rnn_cell/kernel/Initializer/random_uniformAddVdynamic_rnn/multi_rnn_cell/cell_2/basic_rnn_cell/kernel/Initializer/random_uniform/mulVdynamic_rnn/multi_rnn_cell/cell_2/basic_rnn_cell/kernel/Initializer/random_uniform/min*
T0*J
_class@
><loc:@dynamic_rnn/multi_rnn_cell/cell_2/basic_rnn_cell/kernel* 
_output_shapes
:

ű
7dynamic_rnn/multi_rnn_cell/cell_2/basic_rnn_cell/kernel
VariableV2*
shared_name *J
_class@
><loc:@dynamic_rnn/multi_rnn_cell/cell_2/basic_rnn_cell/kernel*
	container *
shape:
*
dtype0* 
_output_shapes
:

ő
>dynamic_rnn/multi_rnn_cell/cell_2/basic_rnn_cell/kernel/AssignAssign7dynamic_rnn/multi_rnn_cell/cell_2/basic_rnn_cell/kernelRdynamic_rnn/multi_rnn_cell/cell_2/basic_rnn_cell/kernel/Initializer/random_uniform*
T0*J
_class@
><loc:@dynamic_rnn/multi_rnn_cell/cell_2/basic_rnn_cell/kernel*
validate_shape(* 
_output_shapes
:
*
use_locking(
Ź
<dynamic_rnn/multi_rnn_cell/cell_2/basic_rnn_cell/kernel/readIdentity7dynamic_rnn/multi_rnn_cell/cell_2/basic_rnn_cell/kernel* 
_output_shapes
:
*
T0
ŕ
Gdynamic_rnn/multi_rnn_cell/cell_2/basic_rnn_cell/bias/Initializer/zerosConst*H
_class>
<:loc:@dynamic_rnn/multi_rnn_cell/cell_2/basic_rnn_cell/bias*
valueB*    *
dtype0*
_output_shapes	
:
í
5dynamic_rnn/multi_rnn_cell/cell_2/basic_rnn_cell/bias
VariableV2*
shared_name *H
_class>
<:loc:@dynamic_rnn/multi_rnn_cell/cell_2/basic_rnn_cell/bias*
	container *
shape:*
dtype0*
_output_shapes	
:
ß
<dynamic_rnn/multi_rnn_cell/cell_2/basic_rnn_cell/bias/AssignAssign5dynamic_rnn/multi_rnn_cell/cell_2/basic_rnn_cell/biasGdynamic_rnn/multi_rnn_cell/cell_2/basic_rnn_cell/bias/Initializer/zeros*
use_locking(*
T0*H
_class>
<:loc:@dynamic_rnn/multi_rnn_cell/cell_2/basic_rnn_cell/bias*
validate_shape(*
_output_shapes	
:
Ł
:dynamic_rnn/multi_rnn_cell/cell_2/basic_rnn_cell/bias/readIdentity5dynamic_rnn/multi_rnn_cell/cell_2/basic_rnn_cell/bias*
T0*
_output_shapes	
:
­
Ndynamic_rnn/while/dynamic_rnn/multi_rnn_cell/cell_2/basic_rnn_cell/concat/axisConst^dynamic_rnn/while/Identity*
value	B :*
dtype0*
_output_shapes
: 
Ô
Idynamic_rnn/while/dynamic_rnn/multi_rnn_cell/cell_2/basic_rnn_cell/concatConcatV2Gdynamic_rnn/while/dynamic_rnn/multi_rnn_cell/cell_1/basic_rnn_cell/Reludynamic_rnn/while/Identity_5Ndynamic_rnn/while/dynamic_rnn/multi_rnn_cell/cell_2/basic_rnn_cell/concat/axis*
N*(
_output_shapes
:˙˙˙˙˙˙˙˙˙*

Tidx0*
T0
Č
Idynamic_rnn/while/dynamic_rnn/multi_rnn_cell/cell_2/basic_rnn_cell/MatMulMatMulIdynamic_rnn/while/dynamic_rnn/multi_rnn_cell/cell_2/basic_rnn_cell/concatOdynamic_rnn/while/dynamic_rnn/multi_rnn_cell/cell_2/basic_rnn_cell/MatMul/Enter*
T0*(
_output_shapes
:˙˙˙˙˙˙˙˙˙*
transpose_a( *
transpose_b( 
 
Odynamic_rnn/while/dynamic_rnn/multi_rnn_cell/cell_2/basic_rnn_cell/MatMul/EnterEnter<dynamic_rnn/multi_rnn_cell/cell_2/basic_rnn_cell/kernel/read*
T0*
is_constant(*
parallel_iterations * 
_output_shapes
:
*/

frame_name!dynamic_rnn/while/while_context
ź
Jdynamic_rnn/while/dynamic_rnn/multi_rnn_cell/cell_2/basic_rnn_cell/BiasAddBiasAddIdynamic_rnn/while/dynamic_rnn/multi_rnn_cell/cell_2/basic_rnn_cell/MatMulPdynamic_rnn/while/dynamic_rnn/multi_rnn_cell/cell_2/basic_rnn_cell/BiasAdd/Enter*
data_formatNHWC*(
_output_shapes
:˙˙˙˙˙˙˙˙˙*
T0

Pdynamic_rnn/while/dynamic_rnn/multi_rnn_cell/cell_2/basic_rnn_cell/BiasAdd/EnterEnter:dynamic_rnn/multi_rnn_cell/cell_2/basic_rnn_cell/bias/read*
is_constant(*
parallel_iterations *
_output_shapes	
:*/

frame_name!dynamic_rnn/while/while_context*
T0
Î
Gdynamic_rnn/while/dynamic_rnn/multi_rnn_cell/cell_2/basic_rnn_cell/ReluReluJdynamic_rnn/while/dynamic_rnn/multi_rnn_cell/cell_2/basic_rnn_cell/BiasAdd*
T0*(
_output_shapes
:˙˙˙˙˙˙˙˙˙
ő
Xdynamic_rnn/multi_rnn_cell/cell_3/basic_rnn_cell/kernel/Initializer/random_uniform/shapeConst*J
_class@
><loc:@dynamic_rnn/multi_rnn_cell/cell_3/basic_rnn_cell/kernel*
valueB"      *
dtype0*
_output_shapes
:
ç
Vdynamic_rnn/multi_rnn_cell/cell_3/basic_rnn_cell/kernel/Initializer/random_uniform/minConst*J
_class@
><loc:@dynamic_rnn/multi_rnn_cell/cell_3/basic_rnn_cell/kernel*
valueB
 *óľ˝*
dtype0*
_output_shapes
: 
ç
Vdynamic_rnn/multi_rnn_cell/cell_3/basic_rnn_cell/kernel/Initializer/random_uniform/maxConst*
dtype0*
_output_shapes
: *J
_class@
><loc:@dynamic_rnn/multi_rnn_cell/cell_3/basic_rnn_cell/kernel*
valueB
 *óľ=
č
`dynamic_rnn/multi_rnn_cell/cell_3/basic_rnn_cell/kernel/Initializer/random_uniform/RandomUniformRandomUniformXdynamic_rnn/multi_rnn_cell/cell_3/basic_rnn_cell/kernel/Initializer/random_uniform/shape*
dtype0* 
_output_shapes
:
*

seed *
T0*J
_class@
><loc:@dynamic_rnn/multi_rnn_cell/cell_3/basic_rnn_cell/kernel*
seed2 
ú
Vdynamic_rnn/multi_rnn_cell/cell_3/basic_rnn_cell/kernel/Initializer/random_uniform/subSubVdynamic_rnn/multi_rnn_cell/cell_3/basic_rnn_cell/kernel/Initializer/random_uniform/maxVdynamic_rnn/multi_rnn_cell/cell_3/basic_rnn_cell/kernel/Initializer/random_uniform/min*
T0*J
_class@
><loc:@dynamic_rnn/multi_rnn_cell/cell_3/basic_rnn_cell/kernel*
_output_shapes
: 

Vdynamic_rnn/multi_rnn_cell/cell_3/basic_rnn_cell/kernel/Initializer/random_uniform/mulMul`dynamic_rnn/multi_rnn_cell/cell_3/basic_rnn_cell/kernel/Initializer/random_uniform/RandomUniformVdynamic_rnn/multi_rnn_cell/cell_3/basic_rnn_cell/kernel/Initializer/random_uniform/sub*
T0*J
_class@
><loc:@dynamic_rnn/multi_rnn_cell/cell_3/basic_rnn_cell/kernel* 
_output_shapes
:


Rdynamic_rnn/multi_rnn_cell/cell_3/basic_rnn_cell/kernel/Initializer/random_uniformAddVdynamic_rnn/multi_rnn_cell/cell_3/basic_rnn_cell/kernel/Initializer/random_uniform/mulVdynamic_rnn/multi_rnn_cell/cell_3/basic_rnn_cell/kernel/Initializer/random_uniform/min*J
_class@
><loc:@dynamic_rnn/multi_rnn_cell/cell_3/basic_rnn_cell/kernel* 
_output_shapes
:
*
T0
ű
7dynamic_rnn/multi_rnn_cell/cell_3/basic_rnn_cell/kernel
VariableV2*
shape:
*
dtype0* 
_output_shapes
:
*
shared_name *J
_class@
><loc:@dynamic_rnn/multi_rnn_cell/cell_3/basic_rnn_cell/kernel*
	container 
ő
>dynamic_rnn/multi_rnn_cell/cell_3/basic_rnn_cell/kernel/AssignAssign7dynamic_rnn/multi_rnn_cell/cell_3/basic_rnn_cell/kernelRdynamic_rnn/multi_rnn_cell/cell_3/basic_rnn_cell/kernel/Initializer/random_uniform*J
_class@
><loc:@dynamic_rnn/multi_rnn_cell/cell_3/basic_rnn_cell/kernel*
validate_shape(* 
_output_shapes
:
*
use_locking(*
T0
Ź
<dynamic_rnn/multi_rnn_cell/cell_3/basic_rnn_cell/kernel/readIdentity7dynamic_rnn/multi_rnn_cell/cell_3/basic_rnn_cell/kernel* 
_output_shapes
:
*
T0
ŕ
Gdynamic_rnn/multi_rnn_cell/cell_3/basic_rnn_cell/bias/Initializer/zerosConst*H
_class>
<:loc:@dynamic_rnn/multi_rnn_cell/cell_3/basic_rnn_cell/bias*
valueB*    *
dtype0*
_output_shapes	
:
í
5dynamic_rnn/multi_rnn_cell/cell_3/basic_rnn_cell/bias
VariableV2*H
_class>
<:loc:@dynamic_rnn/multi_rnn_cell/cell_3/basic_rnn_cell/bias*
	container *
shape:*
dtype0*
_output_shapes	
:*
shared_name 
ß
<dynamic_rnn/multi_rnn_cell/cell_3/basic_rnn_cell/bias/AssignAssign5dynamic_rnn/multi_rnn_cell/cell_3/basic_rnn_cell/biasGdynamic_rnn/multi_rnn_cell/cell_3/basic_rnn_cell/bias/Initializer/zeros*
use_locking(*
T0*H
_class>
<:loc:@dynamic_rnn/multi_rnn_cell/cell_3/basic_rnn_cell/bias*
validate_shape(*
_output_shapes	
:
Ł
:dynamic_rnn/multi_rnn_cell/cell_3/basic_rnn_cell/bias/readIdentity5dynamic_rnn/multi_rnn_cell/cell_3/basic_rnn_cell/bias*
T0*
_output_shapes	
:
­
Ndynamic_rnn/while/dynamic_rnn/multi_rnn_cell/cell_3/basic_rnn_cell/concat/axisConst^dynamic_rnn/while/Identity*
dtype0*
_output_shapes
: *
value	B :
Ô
Idynamic_rnn/while/dynamic_rnn/multi_rnn_cell/cell_3/basic_rnn_cell/concatConcatV2Gdynamic_rnn/while/dynamic_rnn/multi_rnn_cell/cell_2/basic_rnn_cell/Reludynamic_rnn/while/Identity_6Ndynamic_rnn/while/dynamic_rnn/multi_rnn_cell/cell_3/basic_rnn_cell/concat/axis*(
_output_shapes
:˙˙˙˙˙˙˙˙˙*

Tidx0*
T0*
N
Č
Idynamic_rnn/while/dynamic_rnn/multi_rnn_cell/cell_3/basic_rnn_cell/MatMulMatMulIdynamic_rnn/while/dynamic_rnn/multi_rnn_cell/cell_3/basic_rnn_cell/concatOdynamic_rnn/while/dynamic_rnn/multi_rnn_cell/cell_3/basic_rnn_cell/MatMul/Enter*
transpose_b( *
T0*(
_output_shapes
:˙˙˙˙˙˙˙˙˙*
transpose_a( 
 
Odynamic_rnn/while/dynamic_rnn/multi_rnn_cell/cell_3/basic_rnn_cell/MatMul/EnterEnter<dynamic_rnn/multi_rnn_cell/cell_3/basic_rnn_cell/kernel/read*
T0*
is_constant(*
parallel_iterations * 
_output_shapes
:
*/

frame_name!dynamic_rnn/while/while_context
ź
Jdynamic_rnn/while/dynamic_rnn/multi_rnn_cell/cell_3/basic_rnn_cell/BiasAddBiasAddIdynamic_rnn/while/dynamic_rnn/multi_rnn_cell/cell_3/basic_rnn_cell/MatMulPdynamic_rnn/while/dynamic_rnn/multi_rnn_cell/cell_3/basic_rnn_cell/BiasAdd/Enter*
data_formatNHWC*(
_output_shapes
:˙˙˙˙˙˙˙˙˙*
T0

Pdynamic_rnn/while/dynamic_rnn/multi_rnn_cell/cell_3/basic_rnn_cell/BiasAdd/EnterEnter:dynamic_rnn/multi_rnn_cell/cell_3/basic_rnn_cell/bias/read*
T0*
is_constant(*
parallel_iterations *
_output_shapes	
:*/

frame_name!dynamic_rnn/while/while_context
Î
Gdynamic_rnn/while/dynamic_rnn/multi_rnn_cell/cell_3/basic_rnn_cell/ReluReluJdynamic_rnn/while/dynamic_rnn/multi_rnn_cell/cell_3/basic_rnn_cell/BiasAdd*(
_output_shapes
:˙˙˙˙˙˙˙˙˙*
T0
ő
Xdynamic_rnn/multi_rnn_cell/cell_4/basic_rnn_cell/kernel/Initializer/random_uniform/shapeConst*
_output_shapes
:*J
_class@
><loc:@dynamic_rnn/multi_rnn_cell/cell_4/basic_rnn_cell/kernel*
valueB"      *
dtype0
ç
Vdynamic_rnn/multi_rnn_cell/cell_4/basic_rnn_cell/kernel/Initializer/random_uniform/minConst*J
_class@
><loc:@dynamic_rnn/multi_rnn_cell/cell_4/basic_rnn_cell/kernel*
valueB
 *óľ˝*
dtype0*
_output_shapes
: 
ç
Vdynamic_rnn/multi_rnn_cell/cell_4/basic_rnn_cell/kernel/Initializer/random_uniform/maxConst*J
_class@
><loc:@dynamic_rnn/multi_rnn_cell/cell_4/basic_rnn_cell/kernel*
valueB
 *óľ=*
dtype0*
_output_shapes
: 
č
`dynamic_rnn/multi_rnn_cell/cell_4/basic_rnn_cell/kernel/Initializer/random_uniform/RandomUniformRandomUniformXdynamic_rnn/multi_rnn_cell/cell_4/basic_rnn_cell/kernel/Initializer/random_uniform/shape*
dtype0* 
_output_shapes
:
*

seed *
T0*J
_class@
><loc:@dynamic_rnn/multi_rnn_cell/cell_4/basic_rnn_cell/kernel*
seed2 
ú
Vdynamic_rnn/multi_rnn_cell/cell_4/basic_rnn_cell/kernel/Initializer/random_uniform/subSubVdynamic_rnn/multi_rnn_cell/cell_4/basic_rnn_cell/kernel/Initializer/random_uniform/maxVdynamic_rnn/multi_rnn_cell/cell_4/basic_rnn_cell/kernel/Initializer/random_uniform/min*
T0*J
_class@
><loc:@dynamic_rnn/multi_rnn_cell/cell_4/basic_rnn_cell/kernel*
_output_shapes
: 

Vdynamic_rnn/multi_rnn_cell/cell_4/basic_rnn_cell/kernel/Initializer/random_uniform/mulMul`dynamic_rnn/multi_rnn_cell/cell_4/basic_rnn_cell/kernel/Initializer/random_uniform/RandomUniformVdynamic_rnn/multi_rnn_cell/cell_4/basic_rnn_cell/kernel/Initializer/random_uniform/sub*J
_class@
><loc:@dynamic_rnn/multi_rnn_cell/cell_4/basic_rnn_cell/kernel* 
_output_shapes
:
*
T0

Rdynamic_rnn/multi_rnn_cell/cell_4/basic_rnn_cell/kernel/Initializer/random_uniformAddVdynamic_rnn/multi_rnn_cell/cell_4/basic_rnn_cell/kernel/Initializer/random_uniform/mulVdynamic_rnn/multi_rnn_cell/cell_4/basic_rnn_cell/kernel/Initializer/random_uniform/min*
T0*J
_class@
><loc:@dynamic_rnn/multi_rnn_cell/cell_4/basic_rnn_cell/kernel* 
_output_shapes
:

ű
7dynamic_rnn/multi_rnn_cell/cell_4/basic_rnn_cell/kernel
VariableV2*
dtype0* 
_output_shapes
:
*
shared_name *J
_class@
><loc:@dynamic_rnn/multi_rnn_cell/cell_4/basic_rnn_cell/kernel*
	container *
shape:

ő
>dynamic_rnn/multi_rnn_cell/cell_4/basic_rnn_cell/kernel/AssignAssign7dynamic_rnn/multi_rnn_cell/cell_4/basic_rnn_cell/kernelRdynamic_rnn/multi_rnn_cell/cell_4/basic_rnn_cell/kernel/Initializer/random_uniform*
use_locking(*
T0*J
_class@
><loc:@dynamic_rnn/multi_rnn_cell/cell_4/basic_rnn_cell/kernel*
validate_shape(* 
_output_shapes
:

Ź
<dynamic_rnn/multi_rnn_cell/cell_4/basic_rnn_cell/kernel/readIdentity7dynamic_rnn/multi_rnn_cell/cell_4/basic_rnn_cell/kernel*
T0* 
_output_shapes
:

ŕ
Gdynamic_rnn/multi_rnn_cell/cell_4/basic_rnn_cell/bias/Initializer/zerosConst*
dtype0*
_output_shapes	
:*H
_class>
<:loc:@dynamic_rnn/multi_rnn_cell/cell_4/basic_rnn_cell/bias*
valueB*    
í
5dynamic_rnn/multi_rnn_cell/cell_4/basic_rnn_cell/bias
VariableV2*
dtype0*
_output_shapes	
:*
shared_name *H
_class>
<:loc:@dynamic_rnn/multi_rnn_cell/cell_4/basic_rnn_cell/bias*
	container *
shape:
ß
<dynamic_rnn/multi_rnn_cell/cell_4/basic_rnn_cell/bias/AssignAssign5dynamic_rnn/multi_rnn_cell/cell_4/basic_rnn_cell/biasGdynamic_rnn/multi_rnn_cell/cell_4/basic_rnn_cell/bias/Initializer/zeros*H
_class>
<:loc:@dynamic_rnn/multi_rnn_cell/cell_4/basic_rnn_cell/bias*
validate_shape(*
_output_shapes	
:*
use_locking(*
T0
Ł
:dynamic_rnn/multi_rnn_cell/cell_4/basic_rnn_cell/bias/readIdentity5dynamic_rnn/multi_rnn_cell/cell_4/basic_rnn_cell/bias*
_output_shapes	
:*
T0
­
Ndynamic_rnn/while/dynamic_rnn/multi_rnn_cell/cell_4/basic_rnn_cell/concat/axisConst^dynamic_rnn/while/Identity*
value	B :*
dtype0*
_output_shapes
: 
Ô
Idynamic_rnn/while/dynamic_rnn/multi_rnn_cell/cell_4/basic_rnn_cell/concatConcatV2Gdynamic_rnn/while/dynamic_rnn/multi_rnn_cell/cell_3/basic_rnn_cell/Reludynamic_rnn/while/Identity_7Ndynamic_rnn/while/dynamic_rnn/multi_rnn_cell/cell_4/basic_rnn_cell/concat/axis*
N*(
_output_shapes
:˙˙˙˙˙˙˙˙˙*

Tidx0*
T0
Č
Idynamic_rnn/while/dynamic_rnn/multi_rnn_cell/cell_4/basic_rnn_cell/MatMulMatMulIdynamic_rnn/while/dynamic_rnn/multi_rnn_cell/cell_4/basic_rnn_cell/concatOdynamic_rnn/while/dynamic_rnn/multi_rnn_cell/cell_4/basic_rnn_cell/MatMul/Enter*
T0*(
_output_shapes
:˙˙˙˙˙˙˙˙˙*
transpose_a( *
transpose_b( 
 
Odynamic_rnn/while/dynamic_rnn/multi_rnn_cell/cell_4/basic_rnn_cell/MatMul/EnterEnter<dynamic_rnn/multi_rnn_cell/cell_4/basic_rnn_cell/kernel/read*
parallel_iterations * 
_output_shapes
:
*/

frame_name!dynamic_rnn/while/while_context*
T0*
is_constant(
ź
Jdynamic_rnn/while/dynamic_rnn/multi_rnn_cell/cell_4/basic_rnn_cell/BiasAddBiasAddIdynamic_rnn/while/dynamic_rnn/multi_rnn_cell/cell_4/basic_rnn_cell/MatMulPdynamic_rnn/while/dynamic_rnn/multi_rnn_cell/cell_4/basic_rnn_cell/BiasAdd/Enter*
data_formatNHWC*(
_output_shapes
:˙˙˙˙˙˙˙˙˙*
T0

Pdynamic_rnn/while/dynamic_rnn/multi_rnn_cell/cell_4/basic_rnn_cell/BiasAdd/EnterEnter:dynamic_rnn/multi_rnn_cell/cell_4/basic_rnn_cell/bias/read*
T0*
is_constant(*
parallel_iterations *
_output_shapes	
:*/

frame_name!dynamic_rnn/while/while_context
Î
Gdynamic_rnn/while/dynamic_rnn/multi_rnn_cell/cell_4/basic_rnn_cell/ReluReluJdynamic_rnn/while/dynamic_rnn/multi_rnn_cell/cell_4/basic_rnn_cell/BiasAdd*
T0*(
_output_shapes
:˙˙˙˙˙˙˙˙˙

5dynamic_rnn/while/TensorArrayWrite/TensorArrayWriteV3TensorArrayWriteV3;dynamic_rnn/while/TensorArrayWrite/TensorArrayWriteV3/Enterdynamic_rnn/while/Identity_1Gdynamic_rnn/while/dynamic_rnn/multi_rnn_cell/cell_4/basic_rnn_cell/Reludynamic_rnn/while/Identity_2*
T0*Z
_classP
NLloc:@dynamic_rnn/while/dynamic_rnn/multi_rnn_cell/cell_4/basic_rnn_cell/Relu*
_output_shapes
: 
˝
;dynamic_rnn/while/TensorArrayWrite/TensorArrayWriteV3/EnterEnterdynamic_rnn/TensorArray*
_output_shapes
:*/

frame_name!dynamic_rnn/while/while_context*
T0*Z
_classP
NLloc:@dynamic_rnn/while/dynamic_rnn/multi_rnn_cell/cell_4/basic_rnn_cell/Relu*
parallel_iterations *
is_constant(
x
dynamic_rnn/while/add_1/yConst^dynamic_rnn/while/Identity*
value	B :*
dtype0*
_output_shapes
: 
x
dynamic_rnn/while/add_1Adddynamic_rnn/while/Identity_1dynamic_rnn/while/add_1/y*
_output_shapes
: *
T0
h
dynamic_rnn/while/NextIterationNextIterationdynamic_rnn/while/add*
T0*
_output_shapes
: 
l
!dynamic_rnn/while/NextIteration_1NextIterationdynamic_rnn/while/add_1*
T0*
_output_shapes
: 

!dynamic_rnn/while/NextIteration_2NextIteration5dynamic_rnn/while/TensorArrayWrite/TensorArrayWriteV3*
T0*
_output_shapes
: 
Ž
!dynamic_rnn/while/NextIteration_3NextIterationGdynamic_rnn/while/dynamic_rnn/multi_rnn_cell/cell_0/basic_rnn_cell/Relu*(
_output_shapes
:˙˙˙˙˙˙˙˙˙*
T0
Ž
!dynamic_rnn/while/NextIteration_4NextIterationGdynamic_rnn/while/dynamic_rnn/multi_rnn_cell/cell_1/basic_rnn_cell/Relu*
T0*(
_output_shapes
:˙˙˙˙˙˙˙˙˙
Ž
!dynamic_rnn/while/NextIteration_5NextIterationGdynamic_rnn/while/dynamic_rnn/multi_rnn_cell/cell_2/basic_rnn_cell/Relu*
T0*(
_output_shapes
:˙˙˙˙˙˙˙˙˙
Ž
!dynamic_rnn/while/NextIteration_6NextIterationGdynamic_rnn/while/dynamic_rnn/multi_rnn_cell/cell_3/basic_rnn_cell/Relu*(
_output_shapes
:˙˙˙˙˙˙˙˙˙*
T0
Ž
!dynamic_rnn/while/NextIteration_7NextIterationGdynamic_rnn/while/dynamic_rnn/multi_rnn_cell/cell_4/basic_rnn_cell/Relu*
T0*(
_output_shapes
:˙˙˙˙˙˙˙˙˙
Y
dynamic_rnn/while/ExitExitdynamic_rnn/while/Switch*
T0*
_output_shapes
: 
]
dynamic_rnn/while/Exit_1Exitdynamic_rnn/while/Switch_1*
T0*
_output_shapes
: 
]
dynamic_rnn/while/Exit_2Exitdynamic_rnn/while/Switch_2*
T0*
_output_shapes
: 
o
dynamic_rnn/while/Exit_3Exitdynamic_rnn/while/Switch_3*
T0*(
_output_shapes
:˙˙˙˙˙˙˙˙˙
o
dynamic_rnn/while/Exit_4Exitdynamic_rnn/while/Switch_4*
T0*(
_output_shapes
:˙˙˙˙˙˙˙˙˙
o
dynamic_rnn/while/Exit_5Exitdynamic_rnn/while/Switch_5*
T0*(
_output_shapes
:˙˙˙˙˙˙˙˙˙
o
dynamic_rnn/while/Exit_6Exitdynamic_rnn/while/Switch_6*
T0*(
_output_shapes
:˙˙˙˙˙˙˙˙˙
o
dynamic_rnn/while/Exit_7Exitdynamic_rnn/while/Switch_7*
T0*(
_output_shapes
:˙˙˙˙˙˙˙˙˙
ş
.dynamic_rnn/TensorArrayStack/TensorArraySizeV3TensorArraySizeV3dynamic_rnn/TensorArraydynamic_rnn/while/Exit_2**
_class 
loc:@dynamic_rnn/TensorArray*
_output_shapes
: 

(dynamic_rnn/TensorArrayStack/range/startConst**
_class 
loc:@dynamic_rnn/TensorArray*
value	B : *
dtype0*
_output_shapes
: 

(dynamic_rnn/TensorArrayStack/range/deltaConst**
_class 
loc:@dynamic_rnn/TensorArray*
value	B :*
dtype0*
_output_shapes
: 

"dynamic_rnn/TensorArrayStack/rangeRange(dynamic_rnn/TensorArrayStack/range/start.dynamic_rnn/TensorArrayStack/TensorArraySizeV3(dynamic_rnn/TensorArrayStack/range/delta**
_class 
loc:@dynamic_rnn/TensorArray*#
_output_shapes
:˙˙˙˙˙˙˙˙˙*

Tidx0
Ź
0dynamic_rnn/TensorArrayStack/TensorArrayGatherV3TensorArrayGatherV3dynamic_rnn/TensorArray"dynamic_rnn/TensorArrayStack/rangedynamic_rnn/while/Exit_2**
_class 
loc:@dynamic_rnn/TensorArray*
dtype0*,
_output_shapes
:˙˙˙˙˙˙˙˙˙*%
element_shape:˙˙˙˙˙˙˙˙˙
^
dynamic_rnn/Const_1Const*
valueB:*
dtype0*
_output_shapes
:
T
dynamic_rnn/Rank_1Const*
value	B :*
dtype0*
_output_shapes
: 
[
dynamic_rnn/range_1/startConst*
value	B :*
dtype0*
_output_shapes
: 
[
dynamic_rnn/range_1/deltaConst*
value	B :*
dtype0*
_output_shapes
: 

dynamic_rnn/range_1Rangedynamic_rnn/range_1/startdynamic_rnn/Rank_1dynamic_rnn/range_1/delta*
_output_shapes
:*

Tidx0
n
dynamic_rnn/concat_2/values_0Const*
valueB"       *
dtype0*
_output_shapes
:
[
dynamic_rnn/concat_2/axisConst*
value	B : *
dtype0*
_output_shapes
: 
Š
dynamic_rnn/concat_2ConcatV2dynamic_rnn/concat_2/values_0dynamic_rnn/range_1dynamic_rnn/concat_2/axis*
T0*
N*
_output_shapes
:*

Tidx0
°
dynamic_rnn/transpose_1	Transpose0dynamic_rnn/TensorArrayStack/TensorArrayGatherV3dynamic_rnn/concat_2*,
_output_shapes
:˙˙˙˙˙˙˙˙˙*
Tperm0*
T0
U
strided_slice/stackConst*
_output_shapes
: *
value	B : *
dtype0
`
strided_slice/stack_1/values_0Const*
value	B : *
dtype0*
_output_shapes
: 
`
strided_slice/stack_1/values_1Const*
value	B :*
dtype0*
_output_shapes
: 
`
strided_slice/stack_1/values_2Const*
dtype0*
_output_shapes
: *
value	B : 
ˇ
strided_slice/stack_1Packstrided_slice/stack_1/values_0strided_slice/stack_1/values_1strided_slice/stack_1/values_2*
N*
_output_shapes
:*
T0*

axis 
j
strided_slice/stack_2Const*!
valueB"            *
dtype0*
_output_shapes
:
j
strided_slice/stack_3Const*!
valueB"         *
dtype0*
_output_shapes
:
Ł
strided_sliceStridedSlicedynamic_rnn/transpose_1strided_slice/stack_1strided_slice/stack_2strided_slice/stack_3*
Index0*
T0*
shrink_axis_mask *

begin_mask*
ellipsis_mask *
new_axis_mask *
end_mask*,
_output_shapes
:˙˙˙˙˙˙˙˙˙
`
Reshape_1/shapeConst*
valueB"˙˙˙˙   *
dtype0*
_output_shapes
:
u
	Reshape_1Reshapestrided_sliceReshape_1/shape*(
_output_shapes
:˙˙˙˙˙˙˙˙˙*
T0*
Tshape0

-dense/kernel/Initializer/random_uniform/shapeConst*
_class
loc:@dense/kernel*
valueB"      *
dtype0*
_output_shapes
:

+dense/kernel/Initializer/random_uniform/minConst*
_class
loc:@dense/kernel*
valueB
 *   ž*
dtype0*
_output_shapes
: 

+dense/kernel/Initializer/random_uniform/maxConst*
_class
loc:@dense/kernel*
valueB
 *   >*
dtype0*
_output_shapes
: 
ç
5dense/kernel/Initializer/random_uniform/RandomUniformRandomUniform-dense/kernel/Initializer/random_uniform/shape*
T0*
_class
loc:@dense/kernel*
seed2 *
dtype0* 
_output_shapes
:
*

seed 
Î
+dense/kernel/Initializer/random_uniform/subSub+dense/kernel/Initializer/random_uniform/max+dense/kernel/Initializer/random_uniform/min*
T0*
_class
loc:@dense/kernel*
_output_shapes
: 
â
+dense/kernel/Initializer/random_uniform/mulMul5dense/kernel/Initializer/random_uniform/RandomUniform+dense/kernel/Initializer/random_uniform/sub*
T0*
_class
loc:@dense/kernel* 
_output_shapes
:

Ô
'dense/kernel/Initializer/random_uniformAdd+dense/kernel/Initializer/random_uniform/mul+dense/kernel/Initializer/random_uniform/min*
T0*
_class
loc:@dense/kernel* 
_output_shapes
:

Ľ
dense/kernel
VariableV2*
shared_name *
_class
loc:@dense/kernel*
	container *
shape:
*
dtype0* 
_output_shapes
:

É
dense/kernel/AssignAssigndense/kernel'dense/kernel/Initializer/random_uniform*
validate_shape(* 
_output_shapes
:
*
use_locking(*
T0*
_class
loc:@dense/kernel
w
dense/kernel/readIdentitydense/kernel*
T0*
_class
loc:@dense/kernel* 
_output_shapes
:


dense/bias/Initializer/zerosConst*
_class
loc:@dense/bias*
valueB*    *
dtype0*
_output_shapes	
:


dense/bias
VariableV2*
_output_shapes	
:*
shared_name *
_class
loc:@dense/bias*
	container *
shape:*
dtype0
ł
dense/bias/AssignAssign
dense/biasdense/bias/Initializer/zeros*
_output_shapes	
:*
use_locking(*
T0*
_class
loc:@dense/bias*
validate_shape(
l
dense/bias/readIdentity
dense/bias*
T0*
_class
loc:@dense/bias*
_output_shapes	
:

dense/MatMulMatMul	Reshape_1dense/kernel/read*(
_output_shapes
:˙˙˙˙˙˙˙˙˙*
transpose_a( *
transpose_b( *
T0

dense/BiasAddBiasAdddense/MatMuldense/bias/read*
T0*
data_formatNHWC*(
_output_shapes
:˙˙˙˙˙˙˙˙˙
T

dense/ReluReludense/BiasAdd*
T0*(
_output_shapes
:˙˙˙˙˙˙˙˙˙
Ł
/dense_1/kernel/Initializer/random_uniform/shapeConst*!
_class
loc:@dense_1/kernel*
valueB"      *
dtype0*
_output_shapes
:

-dense_1/kernel/Initializer/random_uniform/minConst*
dtype0*
_output_shapes
: *!
_class
loc:@dense_1/kernel*
valueB
 *n×\ž

-dense_1/kernel/Initializer/random_uniform/maxConst*!
_class
loc:@dense_1/kernel*
valueB
 *n×\>*
dtype0*
_output_shapes
: 
ě
7dense_1/kernel/Initializer/random_uniform/RandomUniformRandomUniform/dense_1/kernel/Initializer/random_uniform/shape*
dtype0*
_output_shapes
:	*

seed *
T0*!
_class
loc:@dense_1/kernel*
seed2 
Ö
-dense_1/kernel/Initializer/random_uniform/subSub-dense_1/kernel/Initializer/random_uniform/max-dense_1/kernel/Initializer/random_uniform/min*
T0*!
_class
loc:@dense_1/kernel*
_output_shapes
: 
é
-dense_1/kernel/Initializer/random_uniform/mulMul7dense_1/kernel/Initializer/random_uniform/RandomUniform-dense_1/kernel/Initializer/random_uniform/sub*!
_class
loc:@dense_1/kernel*
_output_shapes
:	*
T0
Ű
)dense_1/kernel/Initializer/random_uniformAdd-dense_1/kernel/Initializer/random_uniform/mul-dense_1/kernel/Initializer/random_uniform/min*
T0*!
_class
loc:@dense_1/kernel*
_output_shapes
:	
§
dense_1/kernel
VariableV2*
dtype0*
_output_shapes
:	*
shared_name *!
_class
loc:@dense_1/kernel*
	container *
shape:	
Đ
dense_1/kernel/AssignAssigndense_1/kernel)dense_1/kernel/Initializer/random_uniform*
use_locking(*
T0*!
_class
loc:@dense_1/kernel*
validate_shape(*
_output_shapes
:	
|
dense_1/kernel/readIdentitydense_1/kernel*
T0*!
_class
loc:@dense_1/kernel*
_output_shapes
:	

dense_1/bias/Initializer/zerosConst*
_class
loc:@dense_1/bias*
valueB*    *
dtype0*
_output_shapes
:

dense_1/bias
VariableV2*
_output_shapes
:*
shared_name *
_class
loc:@dense_1/bias*
	container *
shape:*
dtype0
ş
dense_1/bias/AssignAssigndense_1/biasdense_1/bias/Initializer/zeros*
use_locking(*
T0*
_class
loc:@dense_1/bias*
validate_shape(*
_output_shapes
:
q
dense_1/bias/readIdentitydense_1/bias*
T0*
_class
loc:@dense_1/bias*
_output_shapes
:

dense_1/MatMulMatMul
dense/Reludense_1/kernel/read*
T0*'
_output_shapes
:˙˙˙˙˙˙˙˙˙*
transpose_a( *
transpose_b( 

dense_1/BiasAddBiasAdddense_1/MatMuldense_1/bias/read*
T0*
data_formatNHWC*'
_output_shapes
:˙˙˙˙˙˙˙˙˙
P

save/ConstConst*
valueB Bmodel*
dtype0*
_output_shapes
: 

save/StringJoin/inputs_1Const*
dtype0*
_output_shapes
: *<
value3B1 B+_temp_a3b00568e6d94900877dd5d5b76e3f2d/part
u
save/StringJoin
StringJoin
save/Constsave/StringJoin/inputs_1*
N*
_output_shapes
: *
	separator 
Q
save/num_shardsConst*
value	B :*
dtype0*
_output_shapes
: 
k
save/ShardedFilename/shardConst"/device:CPU:0*
value	B : *
dtype0*
_output_shapes
: 

save/ShardedFilenameShardedFilenamesave/StringJoinsave/ShardedFilename/shardsave/num_shards"/device:CPU:0*
_output_shapes
: 
ć
save/SaveV2/tensor_namesConst"/device:CPU:0*
valueBýB
dense/biasBdense/kernelBdense_1/biasBdense_1/kernelB5dynamic_rnn/multi_rnn_cell/cell_0/basic_rnn_cell/biasB7dynamic_rnn/multi_rnn_cell/cell_0/basic_rnn_cell/kernelB5dynamic_rnn/multi_rnn_cell/cell_1/basic_rnn_cell/biasB7dynamic_rnn/multi_rnn_cell/cell_1/basic_rnn_cell/kernelB5dynamic_rnn/multi_rnn_cell/cell_2/basic_rnn_cell/biasB7dynamic_rnn/multi_rnn_cell/cell_2/basic_rnn_cell/kernelB5dynamic_rnn/multi_rnn_cell/cell_3/basic_rnn_cell/biasB7dynamic_rnn/multi_rnn_cell/cell_3/basic_rnn_cell/kernelB5dynamic_rnn/multi_rnn_cell/cell_4/basic_rnn_cell/biasB7dynamic_rnn/multi_rnn_cell/cell_4/basic_rnn_cell/kernelBglobal_step*
dtype0*
_output_shapes
:

save/SaveV2/shape_and_slicesConst"/device:CPU:0*
dtype0*
_output_shapes
:*1
value(B&B B B B B B B B B B B B B B B 

save/SaveV2SaveV2save/ShardedFilenamesave/SaveV2/tensor_namessave/SaveV2/shape_and_slices
dense/biasdense/kerneldense_1/biasdense_1/kernel5dynamic_rnn/multi_rnn_cell/cell_0/basic_rnn_cell/bias7dynamic_rnn/multi_rnn_cell/cell_0/basic_rnn_cell/kernel5dynamic_rnn/multi_rnn_cell/cell_1/basic_rnn_cell/bias7dynamic_rnn/multi_rnn_cell/cell_1/basic_rnn_cell/kernel5dynamic_rnn/multi_rnn_cell/cell_2/basic_rnn_cell/bias7dynamic_rnn/multi_rnn_cell/cell_2/basic_rnn_cell/kernel5dynamic_rnn/multi_rnn_cell/cell_3/basic_rnn_cell/bias7dynamic_rnn/multi_rnn_cell/cell_3/basic_rnn_cell/kernel5dynamic_rnn/multi_rnn_cell/cell_4/basic_rnn_cell/bias7dynamic_rnn/multi_rnn_cell/cell_4/basic_rnn_cell/kernelglobal_step"/device:CPU:0*
dtypes
2	
 
save/control_dependencyIdentitysave/ShardedFilename^save/SaveV2"/device:CPU:0*
T0*'
_class
loc:@save/ShardedFilename*
_output_shapes
: 
Ź
+save/MergeV2Checkpoints/checkpoint_prefixesPacksave/ShardedFilename^save/control_dependency"/device:CPU:0*
_output_shapes
:*
T0*

axis *
N

save/MergeV2CheckpointsMergeV2Checkpoints+save/MergeV2Checkpoints/checkpoint_prefixes
save/Const"/device:CPU:0*
delete_old_dirs(

save/IdentityIdentity
save/Const^save/MergeV2Checkpoints^save/control_dependency"/device:CPU:0*
_output_shapes
: *
T0
é
save/RestoreV2/tensor_namesConst"/device:CPU:0*
valueBýB
dense/biasBdense/kernelBdense_1/biasBdense_1/kernelB5dynamic_rnn/multi_rnn_cell/cell_0/basic_rnn_cell/biasB7dynamic_rnn/multi_rnn_cell/cell_0/basic_rnn_cell/kernelB5dynamic_rnn/multi_rnn_cell/cell_1/basic_rnn_cell/biasB7dynamic_rnn/multi_rnn_cell/cell_1/basic_rnn_cell/kernelB5dynamic_rnn/multi_rnn_cell/cell_2/basic_rnn_cell/biasB7dynamic_rnn/multi_rnn_cell/cell_2/basic_rnn_cell/kernelB5dynamic_rnn/multi_rnn_cell/cell_3/basic_rnn_cell/biasB7dynamic_rnn/multi_rnn_cell/cell_3/basic_rnn_cell/kernelB5dynamic_rnn/multi_rnn_cell/cell_4/basic_rnn_cell/biasB7dynamic_rnn/multi_rnn_cell/cell_4/basic_rnn_cell/kernelBglobal_step*
dtype0*
_output_shapes
:

save/RestoreV2/shape_and_slicesConst"/device:CPU:0*1
value(B&B B B B B B B B B B B B B B B *
dtype0*
_output_shapes
:
ĺ
save/RestoreV2	RestoreV2
save/Constsave/RestoreV2/tensor_namessave/RestoreV2/shape_and_slices"/device:CPU:0*
dtypes
2	*P
_output_shapes>
<:::::::::::::::

save/AssignAssign
dense/biassave/RestoreV2*
use_locking(*
T0*
_class
loc:@dense/bias*
validate_shape(*
_output_shapes	
:
Ź
save/Assign_1Assigndense/kernelsave/RestoreV2:1*
use_locking(*
T0*
_class
loc:@dense/kernel*
validate_shape(* 
_output_shapes
:

Ś
save/Assign_2Assigndense_1/biassave/RestoreV2:2*
use_locking(*
T0*
_class
loc:@dense_1/bias*
validate_shape(*
_output_shapes
:
Ż
save/Assign_3Assigndense_1/kernelsave/RestoreV2:3*
validate_shape(*
_output_shapes
:	*
use_locking(*
T0*!
_class
loc:@dense_1/kernel
ů
save/Assign_4Assign5dynamic_rnn/multi_rnn_cell/cell_0/basic_rnn_cell/biassave/RestoreV2:4*
use_locking(*
T0*H
_class>
<:loc:@dynamic_rnn/multi_rnn_cell/cell_0/basic_rnn_cell/bias*
validate_shape(*
_output_shapes	
:

save/Assign_5Assign7dynamic_rnn/multi_rnn_cell/cell_0/basic_rnn_cell/kernelsave/RestoreV2:5*
T0*J
_class@
><loc:@dynamic_rnn/multi_rnn_cell/cell_0/basic_rnn_cell/kernel*
validate_shape(* 
_output_shapes
:
*
use_locking(
ů
save/Assign_6Assign5dynamic_rnn/multi_rnn_cell/cell_1/basic_rnn_cell/biassave/RestoreV2:6*
use_locking(*
T0*H
_class>
<:loc:@dynamic_rnn/multi_rnn_cell/cell_1/basic_rnn_cell/bias*
validate_shape(*
_output_shapes	
:

save/Assign_7Assign7dynamic_rnn/multi_rnn_cell/cell_1/basic_rnn_cell/kernelsave/RestoreV2:7*
use_locking(*
T0*J
_class@
><loc:@dynamic_rnn/multi_rnn_cell/cell_1/basic_rnn_cell/kernel*
validate_shape(* 
_output_shapes
:

ů
save/Assign_8Assign5dynamic_rnn/multi_rnn_cell/cell_2/basic_rnn_cell/biassave/RestoreV2:8*
T0*H
_class>
<:loc:@dynamic_rnn/multi_rnn_cell/cell_2/basic_rnn_cell/bias*
validate_shape(*
_output_shapes	
:*
use_locking(

save/Assign_9Assign7dynamic_rnn/multi_rnn_cell/cell_2/basic_rnn_cell/kernelsave/RestoreV2:9*
T0*J
_class@
><loc:@dynamic_rnn/multi_rnn_cell/cell_2/basic_rnn_cell/kernel*
validate_shape(* 
_output_shapes
:
*
use_locking(
ű
save/Assign_10Assign5dynamic_rnn/multi_rnn_cell/cell_3/basic_rnn_cell/biassave/RestoreV2:10*
use_locking(*
T0*H
_class>
<:loc:@dynamic_rnn/multi_rnn_cell/cell_3/basic_rnn_cell/bias*
validate_shape(*
_output_shapes	
:

save/Assign_11Assign7dynamic_rnn/multi_rnn_cell/cell_3/basic_rnn_cell/kernelsave/RestoreV2:11* 
_output_shapes
:
*
use_locking(*
T0*J
_class@
><loc:@dynamic_rnn/multi_rnn_cell/cell_3/basic_rnn_cell/kernel*
validate_shape(
ű
save/Assign_12Assign5dynamic_rnn/multi_rnn_cell/cell_4/basic_rnn_cell/biassave/RestoreV2:12*H
_class>
<:loc:@dynamic_rnn/multi_rnn_cell/cell_4/basic_rnn_cell/bias*
validate_shape(*
_output_shapes	
:*
use_locking(*
T0

save/Assign_13Assign7dynamic_rnn/multi_rnn_cell/cell_4/basic_rnn_cell/kernelsave/RestoreV2:13* 
_output_shapes
:
*
use_locking(*
T0*J
_class@
><loc:@dynamic_rnn/multi_rnn_cell/cell_4/basic_rnn_cell/kernel*
validate_shape(
˘
save/Assign_14Assignglobal_stepsave/RestoreV2:14*
use_locking(*
T0	*
_class
loc:@global_step*
validate_shape(*
_output_shapes
: 

save/restore_shardNoOp^save/Assign^save/Assign_1^save/Assign_10^save/Assign_11^save/Assign_12^save/Assign_13^save/Assign_14^save/Assign_2^save/Assign_3^save/Assign_4^save/Assign_5^save/Assign_6^save/Assign_7^save/Assign_8^save/Assign_9
-
save/restore_allNoOp^save/restore_shard

initNoOp

init_all_tablesNoOp

init_1NoOp
4

group_depsNoOp^init^init_1^init_all_tables
R
save_1/ConstConst*
valueB Bmodel*
dtype0*
_output_shapes
: 

save_1/StringJoin/inputs_1Const*<
value3B1 B+_temp_58f097e714644120942f8d7b80729211/part*
dtype0*
_output_shapes
: 
{
save_1/StringJoin
StringJoinsave_1/Constsave_1/StringJoin/inputs_1*
	separator *
N*
_output_shapes
: 
S
save_1/num_shardsConst*
value	B :*
dtype0*
_output_shapes
: 
m
save_1/ShardedFilename/shardConst"/device:CPU:0*
value	B : *
dtype0*
_output_shapes
: 

save_1/ShardedFilenameShardedFilenamesave_1/StringJoinsave_1/ShardedFilename/shardsave_1/num_shards"/device:CPU:0*
_output_shapes
: 
č
save_1/SaveV2/tensor_namesConst"/device:CPU:0*
valueBýB
dense/biasBdense/kernelBdense_1/biasBdense_1/kernelB5dynamic_rnn/multi_rnn_cell/cell_0/basic_rnn_cell/biasB7dynamic_rnn/multi_rnn_cell/cell_0/basic_rnn_cell/kernelB5dynamic_rnn/multi_rnn_cell/cell_1/basic_rnn_cell/biasB7dynamic_rnn/multi_rnn_cell/cell_1/basic_rnn_cell/kernelB5dynamic_rnn/multi_rnn_cell/cell_2/basic_rnn_cell/biasB7dynamic_rnn/multi_rnn_cell/cell_2/basic_rnn_cell/kernelB5dynamic_rnn/multi_rnn_cell/cell_3/basic_rnn_cell/biasB7dynamic_rnn/multi_rnn_cell/cell_3/basic_rnn_cell/kernelB5dynamic_rnn/multi_rnn_cell/cell_4/basic_rnn_cell/biasB7dynamic_rnn/multi_rnn_cell/cell_4/basic_rnn_cell/kernelBglobal_step*
dtype0*
_output_shapes
:

save_1/SaveV2/shape_and_slicesConst"/device:CPU:0*1
value(B&B B B B B B B B B B B B B B B *
dtype0*
_output_shapes
:

save_1/SaveV2SaveV2save_1/ShardedFilenamesave_1/SaveV2/tensor_namessave_1/SaveV2/shape_and_slices
dense/biasdense/kerneldense_1/biasdense_1/kernel5dynamic_rnn/multi_rnn_cell/cell_0/basic_rnn_cell/bias7dynamic_rnn/multi_rnn_cell/cell_0/basic_rnn_cell/kernel5dynamic_rnn/multi_rnn_cell/cell_1/basic_rnn_cell/bias7dynamic_rnn/multi_rnn_cell/cell_1/basic_rnn_cell/kernel5dynamic_rnn/multi_rnn_cell/cell_2/basic_rnn_cell/bias7dynamic_rnn/multi_rnn_cell/cell_2/basic_rnn_cell/kernel5dynamic_rnn/multi_rnn_cell/cell_3/basic_rnn_cell/bias7dynamic_rnn/multi_rnn_cell/cell_3/basic_rnn_cell/kernel5dynamic_rnn/multi_rnn_cell/cell_4/basic_rnn_cell/bias7dynamic_rnn/multi_rnn_cell/cell_4/basic_rnn_cell/kernelglobal_step"/device:CPU:0*
dtypes
2	
¨
save_1/control_dependencyIdentitysave_1/ShardedFilename^save_1/SaveV2"/device:CPU:0*
_output_shapes
: *
T0*)
_class
loc:@save_1/ShardedFilename
˛
-save_1/MergeV2Checkpoints/checkpoint_prefixesPacksave_1/ShardedFilename^save_1/control_dependency"/device:CPU:0*
_output_shapes
:*
T0*

axis *
N

save_1/MergeV2CheckpointsMergeV2Checkpoints-save_1/MergeV2Checkpoints/checkpoint_prefixessave_1/Const"/device:CPU:0*
delete_old_dirs(

save_1/IdentityIdentitysave_1/Const^save_1/MergeV2Checkpoints^save_1/control_dependency"/device:CPU:0*
T0*
_output_shapes
: 
ë
save_1/RestoreV2/tensor_namesConst"/device:CPU:0*
valueBýB
dense/biasBdense/kernelBdense_1/biasBdense_1/kernelB5dynamic_rnn/multi_rnn_cell/cell_0/basic_rnn_cell/biasB7dynamic_rnn/multi_rnn_cell/cell_0/basic_rnn_cell/kernelB5dynamic_rnn/multi_rnn_cell/cell_1/basic_rnn_cell/biasB7dynamic_rnn/multi_rnn_cell/cell_1/basic_rnn_cell/kernelB5dynamic_rnn/multi_rnn_cell/cell_2/basic_rnn_cell/biasB7dynamic_rnn/multi_rnn_cell/cell_2/basic_rnn_cell/kernelB5dynamic_rnn/multi_rnn_cell/cell_3/basic_rnn_cell/biasB7dynamic_rnn/multi_rnn_cell/cell_3/basic_rnn_cell/kernelB5dynamic_rnn/multi_rnn_cell/cell_4/basic_rnn_cell/biasB7dynamic_rnn/multi_rnn_cell/cell_4/basic_rnn_cell/kernelBglobal_step*
dtype0*
_output_shapes
:

!save_1/RestoreV2/shape_and_slicesConst"/device:CPU:0*1
value(B&B B B B B B B B B B B B B B B *
dtype0*
_output_shapes
:
í
save_1/RestoreV2	RestoreV2save_1/Constsave_1/RestoreV2/tensor_names!save_1/RestoreV2/shape_and_slices"/device:CPU:0*P
_output_shapes>
<:::::::::::::::*
dtypes
2	
Ł
save_1/AssignAssign
dense/biassave_1/RestoreV2*
use_locking(*
T0*
_class
loc:@dense/bias*
validate_shape(*
_output_shapes	
:
°
save_1/Assign_1Assigndense/kernelsave_1/RestoreV2:1*
use_locking(*
T0*
_class
loc:@dense/kernel*
validate_shape(* 
_output_shapes
:

Ş
save_1/Assign_2Assigndense_1/biassave_1/RestoreV2:2*
_class
loc:@dense_1/bias*
validate_shape(*
_output_shapes
:*
use_locking(*
T0
ł
save_1/Assign_3Assigndense_1/kernelsave_1/RestoreV2:3*!
_class
loc:@dense_1/kernel*
validate_shape(*
_output_shapes
:	*
use_locking(*
T0
ý
save_1/Assign_4Assign5dynamic_rnn/multi_rnn_cell/cell_0/basic_rnn_cell/biassave_1/RestoreV2:4*
validate_shape(*
_output_shapes	
:*
use_locking(*
T0*H
_class>
<:loc:@dynamic_rnn/multi_rnn_cell/cell_0/basic_rnn_cell/bias

save_1/Assign_5Assign7dynamic_rnn/multi_rnn_cell/cell_0/basic_rnn_cell/kernelsave_1/RestoreV2:5*J
_class@
><loc:@dynamic_rnn/multi_rnn_cell/cell_0/basic_rnn_cell/kernel*
validate_shape(* 
_output_shapes
:
*
use_locking(*
T0
ý
save_1/Assign_6Assign5dynamic_rnn/multi_rnn_cell/cell_1/basic_rnn_cell/biassave_1/RestoreV2:6*
use_locking(*
T0*H
_class>
<:loc:@dynamic_rnn/multi_rnn_cell/cell_1/basic_rnn_cell/bias*
validate_shape(*
_output_shapes	
:

save_1/Assign_7Assign7dynamic_rnn/multi_rnn_cell/cell_1/basic_rnn_cell/kernelsave_1/RestoreV2:7*
use_locking(*
T0*J
_class@
><loc:@dynamic_rnn/multi_rnn_cell/cell_1/basic_rnn_cell/kernel*
validate_shape(* 
_output_shapes
:

ý
save_1/Assign_8Assign5dynamic_rnn/multi_rnn_cell/cell_2/basic_rnn_cell/biassave_1/RestoreV2:8*
_output_shapes	
:*
use_locking(*
T0*H
_class>
<:loc:@dynamic_rnn/multi_rnn_cell/cell_2/basic_rnn_cell/bias*
validate_shape(

save_1/Assign_9Assign7dynamic_rnn/multi_rnn_cell/cell_2/basic_rnn_cell/kernelsave_1/RestoreV2:9*
use_locking(*
T0*J
_class@
><loc:@dynamic_rnn/multi_rnn_cell/cell_2/basic_rnn_cell/kernel*
validate_shape(* 
_output_shapes
:

˙
save_1/Assign_10Assign5dynamic_rnn/multi_rnn_cell/cell_3/basic_rnn_cell/biassave_1/RestoreV2:10*
_output_shapes	
:*
use_locking(*
T0*H
_class>
<:loc:@dynamic_rnn/multi_rnn_cell/cell_3/basic_rnn_cell/bias*
validate_shape(

save_1/Assign_11Assign7dynamic_rnn/multi_rnn_cell/cell_3/basic_rnn_cell/kernelsave_1/RestoreV2:11*
use_locking(*
T0*J
_class@
><loc:@dynamic_rnn/multi_rnn_cell/cell_3/basic_rnn_cell/kernel*
validate_shape(* 
_output_shapes
:

˙
save_1/Assign_12Assign5dynamic_rnn/multi_rnn_cell/cell_4/basic_rnn_cell/biassave_1/RestoreV2:12*
_output_shapes	
:*
use_locking(*
T0*H
_class>
<:loc:@dynamic_rnn/multi_rnn_cell/cell_4/basic_rnn_cell/bias*
validate_shape(

save_1/Assign_13Assign7dynamic_rnn/multi_rnn_cell/cell_4/basic_rnn_cell/kernelsave_1/RestoreV2:13*
validate_shape(* 
_output_shapes
:
*
use_locking(*
T0*J
_class@
><loc:@dynamic_rnn/multi_rnn_cell/cell_4/basic_rnn_cell/kernel
Ś
save_1/Assign_14Assignglobal_stepsave_1/RestoreV2:14*
use_locking(*
T0	*
_class
loc:@global_step*
validate_shape(*
_output_shapes
: 
­
save_1/restore_shardNoOp^save_1/Assign^save_1/Assign_1^save_1/Assign_10^save_1/Assign_11^save_1/Assign_12^save_1/Assign_13^save_1/Assign_14^save_1/Assign_2^save_1/Assign_3^save_1/Assign_4^save_1/Assign_5^save_1/Assign_6^save_1/Assign_7^save_1/Assign_8^save_1/Assign_9
1
save_1/restore_allNoOp^save_1/restore_shard"B
save_1/Const:0save_1/Identity:0save_1/restore_all (5 @F8" 
legacy_init_op


group_deps"
trainable_variablesý

9dynamic_rnn/multi_rnn_cell/cell_0/basic_rnn_cell/kernel:0>dynamic_rnn/multi_rnn_cell/cell_0/basic_rnn_cell/kernel/Assign>dynamic_rnn/multi_rnn_cell/cell_0/basic_rnn_cell/kernel/read:02Tdynamic_rnn/multi_rnn_cell/cell_0/basic_rnn_cell/kernel/Initializer/random_uniform:0

7dynamic_rnn/multi_rnn_cell/cell_0/basic_rnn_cell/bias:0<dynamic_rnn/multi_rnn_cell/cell_0/basic_rnn_cell/bias/Assign<dynamic_rnn/multi_rnn_cell/cell_0/basic_rnn_cell/bias/read:02Idynamic_rnn/multi_rnn_cell/cell_0/basic_rnn_cell/bias/Initializer/zeros:0

9dynamic_rnn/multi_rnn_cell/cell_1/basic_rnn_cell/kernel:0>dynamic_rnn/multi_rnn_cell/cell_1/basic_rnn_cell/kernel/Assign>dynamic_rnn/multi_rnn_cell/cell_1/basic_rnn_cell/kernel/read:02Tdynamic_rnn/multi_rnn_cell/cell_1/basic_rnn_cell/kernel/Initializer/random_uniform:0

7dynamic_rnn/multi_rnn_cell/cell_1/basic_rnn_cell/bias:0<dynamic_rnn/multi_rnn_cell/cell_1/basic_rnn_cell/bias/Assign<dynamic_rnn/multi_rnn_cell/cell_1/basic_rnn_cell/bias/read:02Idynamic_rnn/multi_rnn_cell/cell_1/basic_rnn_cell/bias/Initializer/zeros:0

9dynamic_rnn/multi_rnn_cell/cell_2/basic_rnn_cell/kernel:0>dynamic_rnn/multi_rnn_cell/cell_2/basic_rnn_cell/kernel/Assign>dynamic_rnn/multi_rnn_cell/cell_2/basic_rnn_cell/kernel/read:02Tdynamic_rnn/multi_rnn_cell/cell_2/basic_rnn_cell/kernel/Initializer/random_uniform:0

7dynamic_rnn/multi_rnn_cell/cell_2/basic_rnn_cell/bias:0<dynamic_rnn/multi_rnn_cell/cell_2/basic_rnn_cell/bias/Assign<dynamic_rnn/multi_rnn_cell/cell_2/basic_rnn_cell/bias/read:02Idynamic_rnn/multi_rnn_cell/cell_2/basic_rnn_cell/bias/Initializer/zeros:0

9dynamic_rnn/multi_rnn_cell/cell_3/basic_rnn_cell/kernel:0>dynamic_rnn/multi_rnn_cell/cell_3/basic_rnn_cell/kernel/Assign>dynamic_rnn/multi_rnn_cell/cell_3/basic_rnn_cell/kernel/read:02Tdynamic_rnn/multi_rnn_cell/cell_3/basic_rnn_cell/kernel/Initializer/random_uniform:0

7dynamic_rnn/multi_rnn_cell/cell_3/basic_rnn_cell/bias:0<dynamic_rnn/multi_rnn_cell/cell_3/basic_rnn_cell/bias/Assign<dynamic_rnn/multi_rnn_cell/cell_3/basic_rnn_cell/bias/read:02Idynamic_rnn/multi_rnn_cell/cell_3/basic_rnn_cell/bias/Initializer/zeros:0

9dynamic_rnn/multi_rnn_cell/cell_4/basic_rnn_cell/kernel:0>dynamic_rnn/multi_rnn_cell/cell_4/basic_rnn_cell/kernel/Assign>dynamic_rnn/multi_rnn_cell/cell_4/basic_rnn_cell/kernel/read:02Tdynamic_rnn/multi_rnn_cell/cell_4/basic_rnn_cell/kernel/Initializer/random_uniform:0

7dynamic_rnn/multi_rnn_cell/cell_4/basic_rnn_cell/bias:0<dynamic_rnn/multi_rnn_cell/cell_4/basic_rnn_cell/bias/Assign<dynamic_rnn/multi_rnn_cell/cell_4/basic_rnn_cell/bias/read:02Idynamic_rnn/multi_rnn_cell/cell_4/basic_rnn_cell/bias/Initializer/zeros:0
e
dense/kernel:0dense/kernel/Assigndense/kernel/read:02)dense/kernel/Initializer/random_uniform:0
T
dense/bias:0dense/bias/Assigndense/bias/read:02dense/bias/Initializer/zeros:0
m
dense_1/kernel:0dense_1/kernel/Assigndense_1/kernel/read:02+dense_1/kernel/Initializer/random_uniform:0
\
dense_1/bias:0dense_1/bias/Assigndense_1/bias/read:02 dense_1/bias/Initializer/zeros:0"k
global_step\Z
X
global_step:0global_step/Assignglobal_step/read:02global_step/Initializer/zeros:0"č
	variablesÚ×
X
global_step:0global_step/Assignglobal_step/read:02global_step/Initializer/zeros:0

9dynamic_rnn/multi_rnn_cell/cell_0/basic_rnn_cell/kernel:0>dynamic_rnn/multi_rnn_cell/cell_0/basic_rnn_cell/kernel/Assign>dynamic_rnn/multi_rnn_cell/cell_0/basic_rnn_cell/kernel/read:02Tdynamic_rnn/multi_rnn_cell/cell_0/basic_rnn_cell/kernel/Initializer/random_uniform:0

7dynamic_rnn/multi_rnn_cell/cell_0/basic_rnn_cell/bias:0<dynamic_rnn/multi_rnn_cell/cell_0/basic_rnn_cell/bias/Assign<dynamic_rnn/multi_rnn_cell/cell_0/basic_rnn_cell/bias/read:02Idynamic_rnn/multi_rnn_cell/cell_0/basic_rnn_cell/bias/Initializer/zeros:0

9dynamic_rnn/multi_rnn_cell/cell_1/basic_rnn_cell/kernel:0>dynamic_rnn/multi_rnn_cell/cell_1/basic_rnn_cell/kernel/Assign>dynamic_rnn/multi_rnn_cell/cell_1/basic_rnn_cell/kernel/read:02Tdynamic_rnn/multi_rnn_cell/cell_1/basic_rnn_cell/kernel/Initializer/random_uniform:0

7dynamic_rnn/multi_rnn_cell/cell_1/basic_rnn_cell/bias:0<dynamic_rnn/multi_rnn_cell/cell_1/basic_rnn_cell/bias/Assign<dynamic_rnn/multi_rnn_cell/cell_1/basic_rnn_cell/bias/read:02Idynamic_rnn/multi_rnn_cell/cell_1/basic_rnn_cell/bias/Initializer/zeros:0

9dynamic_rnn/multi_rnn_cell/cell_2/basic_rnn_cell/kernel:0>dynamic_rnn/multi_rnn_cell/cell_2/basic_rnn_cell/kernel/Assign>dynamic_rnn/multi_rnn_cell/cell_2/basic_rnn_cell/kernel/read:02Tdynamic_rnn/multi_rnn_cell/cell_2/basic_rnn_cell/kernel/Initializer/random_uniform:0

7dynamic_rnn/multi_rnn_cell/cell_2/basic_rnn_cell/bias:0<dynamic_rnn/multi_rnn_cell/cell_2/basic_rnn_cell/bias/Assign<dynamic_rnn/multi_rnn_cell/cell_2/basic_rnn_cell/bias/read:02Idynamic_rnn/multi_rnn_cell/cell_2/basic_rnn_cell/bias/Initializer/zeros:0

9dynamic_rnn/multi_rnn_cell/cell_3/basic_rnn_cell/kernel:0>dynamic_rnn/multi_rnn_cell/cell_3/basic_rnn_cell/kernel/Assign>dynamic_rnn/multi_rnn_cell/cell_3/basic_rnn_cell/kernel/read:02Tdynamic_rnn/multi_rnn_cell/cell_3/basic_rnn_cell/kernel/Initializer/random_uniform:0

7dynamic_rnn/multi_rnn_cell/cell_3/basic_rnn_cell/bias:0<dynamic_rnn/multi_rnn_cell/cell_3/basic_rnn_cell/bias/Assign<dynamic_rnn/multi_rnn_cell/cell_3/basic_rnn_cell/bias/read:02Idynamic_rnn/multi_rnn_cell/cell_3/basic_rnn_cell/bias/Initializer/zeros:0

9dynamic_rnn/multi_rnn_cell/cell_4/basic_rnn_cell/kernel:0>dynamic_rnn/multi_rnn_cell/cell_4/basic_rnn_cell/kernel/Assign>dynamic_rnn/multi_rnn_cell/cell_4/basic_rnn_cell/kernel/read:02Tdynamic_rnn/multi_rnn_cell/cell_4/basic_rnn_cell/kernel/Initializer/random_uniform:0

7dynamic_rnn/multi_rnn_cell/cell_4/basic_rnn_cell/bias:0<dynamic_rnn/multi_rnn_cell/cell_4/basic_rnn_cell/bias/Assign<dynamic_rnn/multi_rnn_cell/cell_4/basic_rnn_cell/bias/read:02Idynamic_rnn/multi_rnn_cell/cell_4/basic_rnn_cell/bias/Initializer/zeros:0
e
dense/kernel:0dense/kernel/Assigndense/kernel/read:02)dense/kernel/Initializer/random_uniform:0
T
dense/bias:0dense/bias/Assigndense/bias/read:02dense/bias/Initializer/zeros:0
m
dense_1/kernel:0dense_1/kernel/Assigndense_1/kernel/read:02+dense_1/kernel/Initializer/random_uniform:0
\
dense_1/bias:0dense_1/bias/Assigndense_1/bias/read:02 dense_1/bias/Initializer/zeros:0"§C
while_contextCC
C
dynamic_rnn/while/while_context *dynamic_rnn/while/LoopCond:02dynamic_rnn/while/Merge:0:dynamic_rnn/while/Identity:0Bdynamic_rnn/while/Exit:0Bdynamic_rnn/while/Exit_1:0Bdynamic_rnn/while/Exit_2:0Bdynamic_rnn/while/Exit_3:0Bdynamic_rnn/while/Exit_4:0Bdynamic_rnn/while/Exit_5:0Bdynamic_rnn/while/Exit_6:0Bdynamic_rnn/while/Exit_7:0J­>
dynamic_rnn/Minimum:0
dynamic_rnn/TensorArray:0
Hdynamic_rnn/TensorArrayUnstack/TensorArrayScatter/TensorArrayScatterV3:0
dynamic_rnn/TensorArray_1:0
<dynamic_rnn/multi_rnn_cell/cell_0/basic_rnn_cell/bias/read:0
>dynamic_rnn/multi_rnn_cell/cell_0/basic_rnn_cell/kernel/read:0
<dynamic_rnn/multi_rnn_cell/cell_1/basic_rnn_cell/bias/read:0
>dynamic_rnn/multi_rnn_cell/cell_1/basic_rnn_cell/kernel/read:0
<dynamic_rnn/multi_rnn_cell/cell_2/basic_rnn_cell/bias/read:0
>dynamic_rnn/multi_rnn_cell/cell_2/basic_rnn_cell/kernel/read:0
<dynamic_rnn/multi_rnn_cell/cell_3/basic_rnn_cell/bias/read:0
>dynamic_rnn/multi_rnn_cell/cell_3/basic_rnn_cell/kernel/read:0
<dynamic_rnn/multi_rnn_cell/cell_4/basic_rnn_cell/bias/read:0
>dynamic_rnn/multi_rnn_cell/cell_4/basic_rnn_cell/kernel/read:0
dynamic_rnn/strided_slice_1:0
dynamic_rnn/while/Enter:0
dynamic_rnn/while/Enter_1:0
dynamic_rnn/while/Enter_2:0
dynamic_rnn/while/Enter_3:0
dynamic_rnn/while/Enter_4:0
dynamic_rnn/while/Enter_5:0
dynamic_rnn/while/Enter_6:0
dynamic_rnn/while/Enter_7:0
dynamic_rnn/while/Exit:0
dynamic_rnn/while/Exit_1:0
dynamic_rnn/while/Exit_2:0
dynamic_rnn/while/Exit_3:0
dynamic_rnn/while/Exit_4:0
dynamic_rnn/while/Exit_5:0
dynamic_rnn/while/Exit_6:0
dynamic_rnn/while/Exit_7:0
dynamic_rnn/while/Identity:0
dynamic_rnn/while/Identity_1:0
dynamic_rnn/while/Identity_2:0
dynamic_rnn/while/Identity_3:0
dynamic_rnn/while/Identity_4:0
dynamic_rnn/while/Identity_5:0
dynamic_rnn/while/Identity_6:0
dynamic_rnn/while/Identity_7:0
dynamic_rnn/while/Less/Enter:0
dynamic_rnn/while/Less:0
 dynamic_rnn/while/Less_1/Enter:0
dynamic_rnn/while/Less_1:0
dynamic_rnn/while/LogicalAnd:0
dynamic_rnn/while/LoopCond:0
dynamic_rnn/while/Merge:0
dynamic_rnn/while/Merge:1
dynamic_rnn/while/Merge_1:0
dynamic_rnn/while/Merge_1:1
dynamic_rnn/while/Merge_2:0
dynamic_rnn/while/Merge_2:1
dynamic_rnn/while/Merge_3:0
dynamic_rnn/while/Merge_3:1
dynamic_rnn/while/Merge_4:0
dynamic_rnn/while/Merge_4:1
dynamic_rnn/while/Merge_5:0
dynamic_rnn/while/Merge_5:1
dynamic_rnn/while/Merge_6:0
dynamic_rnn/while/Merge_6:1
dynamic_rnn/while/Merge_7:0
dynamic_rnn/while/Merge_7:1
!dynamic_rnn/while/NextIteration:0
#dynamic_rnn/while/NextIteration_1:0
#dynamic_rnn/while/NextIteration_2:0
#dynamic_rnn/while/NextIteration_3:0
#dynamic_rnn/while/NextIteration_4:0
#dynamic_rnn/while/NextIteration_5:0
#dynamic_rnn/while/NextIteration_6:0
#dynamic_rnn/while/NextIteration_7:0
dynamic_rnn/while/Switch:0
dynamic_rnn/while/Switch:1
dynamic_rnn/while/Switch_1:0
dynamic_rnn/while/Switch_1:1
dynamic_rnn/while/Switch_2:0
dynamic_rnn/while/Switch_2:1
dynamic_rnn/while/Switch_3:0
dynamic_rnn/while/Switch_3:1
dynamic_rnn/while/Switch_4:0
dynamic_rnn/while/Switch_4:1
dynamic_rnn/while/Switch_5:0
dynamic_rnn/while/Switch_5:1
dynamic_rnn/while/Switch_6:0
dynamic_rnn/while/Switch_6:1
dynamic_rnn/while/Switch_7:0
dynamic_rnn/while/Switch_7:1
+dynamic_rnn/while/TensorArrayReadV3/Enter:0
-dynamic_rnn/while/TensorArrayReadV3/Enter_1:0
%dynamic_rnn/while/TensorArrayReadV3:0
=dynamic_rnn/while/TensorArrayWrite/TensorArrayWriteV3/Enter:0
7dynamic_rnn/while/TensorArrayWrite/TensorArrayWriteV3:0
dynamic_rnn/while/add/y:0
dynamic_rnn/while/add:0
dynamic_rnn/while/add_1/y:0
dynamic_rnn/while/add_1:0
Rdynamic_rnn/while/dynamic_rnn/multi_rnn_cell/cell_0/basic_rnn_cell/BiasAdd/Enter:0
Ldynamic_rnn/while/dynamic_rnn/multi_rnn_cell/cell_0/basic_rnn_cell/BiasAdd:0
Qdynamic_rnn/while/dynamic_rnn/multi_rnn_cell/cell_0/basic_rnn_cell/MatMul/Enter:0
Kdynamic_rnn/while/dynamic_rnn/multi_rnn_cell/cell_0/basic_rnn_cell/MatMul:0
Idynamic_rnn/while/dynamic_rnn/multi_rnn_cell/cell_0/basic_rnn_cell/Relu:0
Pdynamic_rnn/while/dynamic_rnn/multi_rnn_cell/cell_0/basic_rnn_cell/concat/axis:0
Kdynamic_rnn/while/dynamic_rnn/multi_rnn_cell/cell_0/basic_rnn_cell/concat:0
Rdynamic_rnn/while/dynamic_rnn/multi_rnn_cell/cell_1/basic_rnn_cell/BiasAdd/Enter:0
Ldynamic_rnn/while/dynamic_rnn/multi_rnn_cell/cell_1/basic_rnn_cell/BiasAdd:0
Qdynamic_rnn/while/dynamic_rnn/multi_rnn_cell/cell_1/basic_rnn_cell/MatMul/Enter:0
Kdynamic_rnn/while/dynamic_rnn/multi_rnn_cell/cell_1/basic_rnn_cell/MatMul:0
Idynamic_rnn/while/dynamic_rnn/multi_rnn_cell/cell_1/basic_rnn_cell/Relu:0
Pdynamic_rnn/while/dynamic_rnn/multi_rnn_cell/cell_1/basic_rnn_cell/concat/axis:0
Kdynamic_rnn/while/dynamic_rnn/multi_rnn_cell/cell_1/basic_rnn_cell/concat:0
Rdynamic_rnn/while/dynamic_rnn/multi_rnn_cell/cell_2/basic_rnn_cell/BiasAdd/Enter:0
Ldynamic_rnn/while/dynamic_rnn/multi_rnn_cell/cell_2/basic_rnn_cell/BiasAdd:0
Qdynamic_rnn/while/dynamic_rnn/multi_rnn_cell/cell_2/basic_rnn_cell/MatMul/Enter:0
Kdynamic_rnn/while/dynamic_rnn/multi_rnn_cell/cell_2/basic_rnn_cell/MatMul:0
Idynamic_rnn/while/dynamic_rnn/multi_rnn_cell/cell_2/basic_rnn_cell/Relu:0
Pdynamic_rnn/while/dynamic_rnn/multi_rnn_cell/cell_2/basic_rnn_cell/concat/axis:0
Kdynamic_rnn/while/dynamic_rnn/multi_rnn_cell/cell_2/basic_rnn_cell/concat:0
Rdynamic_rnn/while/dynamic_rnn/multi_rnn_cell/cell_3/basic_rnn_cell/BiasAdd/Enter:0
Ldynamic_rnn/while/dynamic_rnn/multi_rnn_cell/cell_3/basic_rnn_cell/BiasAdd:0
Qdynamic_rnn/while/dynamic_rnn/multi_rnn_cell/cell_3/basic_rnn_cell/MatMul/Enter:0
Kdynamic_rnn/while/dynamic_rnn/multi_rnn_cell/cell_3/basic_rnn_cell/MatMul:0
Idynamic_rnn/while/dynamic_rnn/multi_rnn_cell/cell_3/basic_rnn_cell/Relu:0
Pdynamic_rnn/while/dynamic_rnn/multi_rnn_cell/cell_3/basic_rnn_cell/concat/axis:0
Kdynamic_rnn/while/dynamic_rnn/multi_rnn_cell/cell_3/basic_rnn_cell/concat:0
Rdynamic_rnn/while/dynamic_rnn/multi_rnn_cell/cell_4/basic_rnn_cell/BiasAdd/Enter:0
Ldynamic_rnn/while/dynamic_rnn/multi_rnn_cell/cell_4/basic_rnn_cell/BiasAdd:0
Qdynamic_rnn/while/dynamic_rnn/multi_rnn_cell/cell_4/basic_rnn_cell/MatMul/Enter:0
Kdynamic_rnn/while/dynamic_rnn/multi_rnn_cell/cell_4/basic_rnn_cell/MatMul:0
Idynamic_rnn/while/dynamic_rnn/multi_rnn_cell/cell_4/basic_rnn_cell/Relu:0
Pdynamic_rnn/while/dynamic_rnn/multi_rnn_cell/cell_4/basic_rnn_cell/concat/axis:0
Kdynamic_rnn/while/dynamic_rnn/multi_rnn_cell/cell_4/basic_rnn_cell/concat:0
<dynamic_rnn/multi_rnn_cell/cell_4/basic_rnn_cell/bias/read:0Rdynamic_rnn/while/dynamic_rnn/multi_rnn_cell/cell_4/basic_rnn_cell/BiasAdd/Enter:0
<dynamic_rnn/multi_rnn_cell/cell_3/basic_rnn_cell/bias/read:0Rdynamic_rnn/while/dynamic_rnn/multi_rnn_cell/cell_3/basic_rnn_cell/BiasAdd/Enter:0
>dynamic_rnn/multi_rnn_cell/cell_2/basic_rnn_cell/kernel/read:0Qdynamic_rnn/while/dynamic_rnn/multi_rnn_cell/cell_2/basic_rnn_cell/MatMul/Enter:09
dynamic_rnn/Minimum:0 dynamic_rnn/while/Less_1/Enter:0
<dynamic_rnn/multi_rnn_cell/cell_2/basic_rnn_cell/bias/read:0Rdynamic_rnn/while/dynamic_rnn/multi_rnn_cell/cell_2/basic_rnn_cell/BiasAdd/Enter:0J
dynamic_rnn/TensorArray_1:0+dynamic_rnn/while/TensorArrayReadV3/Enter:0
<dynamic_rnn/multi_rnn_cell/cell_1/basic_rnn_cell/bias/read:0Rdynamic_rnn/while/dynamic_rnn/multi_rnn_cell/cell_1/basic_rnn_cell/BiasAdd/Enter:0
<dynamic_rnn/multi_rnn_cell/cell_0/basic_rnn_cell/bias/read:0Rdynamic_rnn/while/dynamic_rnn/multi_rnn_cell/cell_0/basic_rnn_cell/BiasAdd/Enter:0
>dynamic_rnn/multi_rnn_cell/cell_4/basic_rnn_cell/kernel/read:0Qdynamic_rnn/while/dynamic_rnn/multi_rnn_cell/cell_4/basic_rnn_cell/MatMul/Enter:0
>dynamic_rnn/multi_rnn_cell/cell_1/basic_rnn_cell/kernel/read:0Qdynamic_rnn/while/dynamic_rnn/multi_rnn_cell/cell_1/basic_rnn_cell/MatMul/Enter:0y
Hdynamic_rnn/TensorArrayUnstack/TensorArrayScatter/TensorArrayScatterV3:0-dynamic_rnn/while/TensorArrayReadV3/Enter_1:0?
dynamic_rnn/strided_slice_1:0dynamic_rnn/while/Less/Enter:0Z
dynamic_rnn/TensorArray:0=dynamic_rnn/while/TensorArrayWrite/TensorArrayWriteV3/Enter:0
>dynamic_rnn/multi_rnn_cell/cell_3/basic_rnn_cell/kernel/read:0Qdynamic_rnn/while/dynamic_rnn/multi_rnn_cell/cell_3/basic_rnn_cell/MatMul/Enter:0
>dynamic_rnn/multi_rnn_cell/cell_0/basic_rnn_cell/kernel/read:0Qdynamic_rnn/while/dynamic_rnn/multi_rnn_cell/cell_0/basic_rnn_cell/MatMul/Enter:0Rdynamic_rnn/while/Enter:0Rdynamic_rnn/while/Enter_1:0Rdynamic_rnn/while/Enter_2:0Rdynamic_rnn/while/Enter_3:0Rdynamic_rnn/while/Enter_4:0Rdynamic_rnn/while/Enter_5:0Rdynamic_rnn/while/Enter_6:0Rdynamic_rnn/while/Enter_7:0Zdynamic_rnn/strided_slice_1:0*
serving_default
3
inputs)
input_example_tensor:0˙˙˙˙˙˙˙˙˙3
outputs(
dense_1/BiasAdd:0˙˙˙˙˙˙˙˙˙tensorflow/serving/regress*
out_put
3
inputs)
input_example_tensor:0˙˙˙˙˙˙˙˙˙3
outputs(
dense_1/BiasAdd:0˙˙˙˙˙˙˙˙˙tensorflow/serving/regress