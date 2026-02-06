




// Afbildningsmatrice (transformation matrix) helper
// Returns math content that can be embedded in equations
#let amat(content, left, right) = math.attach(math.mat(content, delim:"["), bl: left, br: right)

#let scalar(x,y) = $lr(chevron.l #x, #y chevron.r)$

#let par = math.partial
