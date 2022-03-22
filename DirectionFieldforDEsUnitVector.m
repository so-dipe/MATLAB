% To create a direction field plot for a differential equation and Make
% all field lines are equal
% We use the concept of unit vectors


%Step 1: Define the x and y axis of your graph
prompt1 = 'Enter Start value for range\n';
start = input(prompt1);
prompt2 = 'Enter Stop vale for range\n';
stop = input(prompt2);
prompt3 = 'Enter Step(INCREMENT) value for range\n';
step = input(prompt3);
[x, y] = meshgrid(start:step:stop,  start:step:stop);

%Step 2: Define the function the vector dy
prompt4 = 'Enter differential equation?, equation should not contain dx or dy \n';
dy = input(prompt4);


%Step 3: Define dx as a ones matrix with the size of dy, i.e using the same
%number of rows and columns as the DY matrix
dx = ones(size(dy));

%Step 4: Define the unit vector dyu and dxu
dyu = dy./sqrt(dy.^2 + dx.^2);
dxu = dx./sqrt(dy.^2 + dx.^2);

%Step 5: Plot the graph with quiver plot
quiver(x,y,dxu,dyu)