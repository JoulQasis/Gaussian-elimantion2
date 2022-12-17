function [invM, dete] = gaussel3(MatrixA)
%GUASSE13 finds the determinant and inverse of a matrix
% using guassian elimination
%length of our matrix
s = length(MatrixA);
%identity matrix with same sXs dimensions 
I = eye(s);
diag = 1;
%if the user want to see the steps
user = input(" 1 for displaying matrices \n 0 for not displaying matrices \n:");
%doing the GE for the lower tringle part of the matrix
for c = 1:s
    for r = c+1:s
        %in case we need row swap send an error
        if MatrixA(c, c) == 0
            error("It cannot be solved without row swap");
        end
        
        coef = MatrixA(r, c) / MatrixA(c, c);
        MatrixA(r,:) =  MatrixA(r,:) - coef *  MatrixA(c,:);
        I(r,:) =  I(r,:) - coef *  I(c,:);
        if user
        display([MatrixA, I]);
        end
    end
end 
%calculating the determinant
for c = 1:s
     diag = diag * MatrixA(c, c);
end

%doing the GE for the upper tringle part of the matrix
for r = 1:s
    for c = r+1:s
        if MatrixA(c, c) == 0
            error("It cannot be solved without row swap");
        end
        coef = MatrixA(r, c) / MatrixA(c, c);
        MatrixA(r,:) =  MatrixA(r,:) - coef *  MatrixA(c,:);
        I(r,:) =  I(r,:) - coef *  I(c,:);
        if user
        display([MatrixA, I]);
        end
    end
end 
%turning the diagonal to Ones to get the identity matrix 
for c = 1:s
    I(c,:) =  I(c,:)/ MatrixA(c,c);
    MatrixA(c,:) =  MatrixA(c,:)/ MatrixA(c,c);
        if user
        display([MatrixA, I]);
        end
end
invM = I;
dete = diag;

end


