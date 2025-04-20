% Exercice 2 - Étude des endomorphismes définis par les matrices A, B et C

% Chargement des matrices de l'exercice 1
load('Ex1.mat');  % Charge les matrices A, B et C

% Définition des endomorphismes f, g et h
f = @(X) A*X;
g = @(X) B*X;
h = @(X) C*X;

% 1. Génération du cercle unité et tracé des images par f, g et h
n = 100;
t = linspace(0, 2*pi, n);
Cercle = [cos(t); sin(t)];  % Cercle unité paramétré

% Application des endomorphismes au cercle
fCercle = zeros(2, n);
gCercle = zeros(2, n);
hCercle = zeros(2, n);

for i = 1:n
    fCercle(:, i) = f(Cercle(:, i));
    gCercle(:, i) = g(Cercle(:, i));
    hCercle(:, i) = h(Cercle(:, i));
end

% Tracé des images des cercles
figure(1);
plot(fCercle(1, :), fCercle(2, :), 'b', 'LineWidth', 2);
title('Image du cercle unité par f (matrice A)');
xlabel('x');
ylabel('y');
axis equal;
grid on;

figure(2);
plot(gCercle(1, :), gCercle(2, :), 'r', 'LineWidth', 2);
title('Image du cercle unité par g (matrice B)');
xlabel('x');
ylabel('y');
axis equal;
grid on;

figure(3);
plot(hCercle(1, :), hCercle(2, :), 'g', 'LineWidth', 2);
title('Image du cercle unité par h (matrice C)');
xlabel('x');
ylabel('y');
axis equal;
grid on;

% 2. Diagonalisation des matrices et vérification des bases orthonormées
% Diagonalisation de A
[PA, DA] = eig(A);
lambdaA = diag(DA);  % Valeurs propres de A

% Affichage des résultats pour A
disp('Matrice A:');
disp(['Valeurs propres: ', num2str(lambdaA')]);
disp('Vecteurs propres:');
disp(PA);

% Vérification base orthonormée pour A
orthoA = PA' * PA;
disp('Vérification orthonormalité (PA''*PA):');
disp(orthoA);

% Diagonalisation de B
[PB, DB] = eig(B);
lambdaB = diag(DB);  % Valeurs propres de B

% Affichage des résultats pour B
disp('Matrice B:');
disp(['Valeurs propres: ', num2str(lambdaB')]);
disp('Vecteurs propres:');
disp(PB);

% Vérification base orthonormée pour B
orthoB = PB' * PB;
disp('Vérification orthonormalité (PB''*PB):');
disp(orthoB);

% Diagonalisation de C
[PC, DC] = eig(C);
lambdaC = diag(DC);  % Valeurs propres de C

% Affichage des résultats pour C
disp('Matrice C:');
disp(['Valeurs propres: ', num2str(lambdaC')]);
disp('Vecteurs propres:');
disp(PC);

% Vérification base orthonormée pour C
orthoC = PC' * PC;
disp('Vérification orthonormalité (PC''*PC):');
disp(orthoC);

% 3. Représentation des vecteurs propres et de leurs images sur les graphiques
% Ajout des vecteurs propres sur la figure 1 (matrice A)
figure(1);
hold on;

% Représentation des vecteurs propres normalisés
e1A = PA(:, 1);
e2A = PA(:, 2);

% Représentation des vecteurs λi*ei
lambda1_e1A = lambdaA(1) * e1A;
lambda2_e2A = lambdaA(2) * e2A;

% Tracer les vecteurs propres et leurs images
quiver(0, 0, e1A(1), e1A(2), 0, 'k', 'LineWidth', 1.5);
quiver(0, 0, e2A(1), e2A(2), 0, 'k', 'LineWidth', 1.5);
quiver(0, 0, lambda1_e1A(1), lambda1_e1A(2), 0, 'm', 'LineWidth', 1.5);
quiver(0, 0, lambda2_e2A(1), lambda2_e2A(2), 0, 'm', 'LineWidth', 1.5);

legend('f(C)', 'e_1', 'e_2', '\lambda_1 e_1', '\lambda_2 e_2');
hold off;

% Ajout des vecteurs propres sur la figure 2 (matrice B)
figure(2);
hold on;

% Représentation des vecteurs propres
e1B = PB(:, 1);
e2B = PB(:, 2);

% Représentation des vecteurs λi*ei
lambda1_e1B = lambdaB(1) * e1B;
lambda2_e2B = lambdaB(2) * e2B;

% Tracer les vecteurs propres et leurs images
quiver(0, 0, e1B(1), e1B(2), 0, 'k', 'LineWidth', 1.5);
quiver(0, 0, e2B(1), e2B(2), 0, 'k', 'LineWidth', 1.5);
quiver(0, 0, lambda1_e1B(1), lambda1_e1B(2), 0, 'm', 'LineWidth', 1.5);
quiver(0, 0, lambda2_e2B(1), lambda2_e2B(2), 0, 'm', 'LineWidth', 1.5);

legend('g(C)', 'e_1', 'e_2', '\lambda_1 e_1', '\lambda_2 e_2');
hold off;

% Ajout des vecteurs propres sur la figure 3 (matrice C)
figure(3);
hold on;

% Représentation des vecteurs propres
e1C = PC(:, 1);
e2C = PC(:, 2);

% Représentation des vecteurs λi*ei
lambda1_e1C = lambdaC(1) * e1C;
lambda2_e2C = lambdaC(2) * e2C;

% Tracer les vecteurs propres et leurs images
quiver(0, 0, e1C(1), e1C(2), 0, 'k', 'LineWidth', 1.5);
quiver(0, 0, e2C(1), e2C(2), 0, 'k', 'LineWidth', 1.5);
quiver(0, 0, lambda1_e1C(1), lambda1_e1C(2), 0, 'm', 'LineWidth', 1.5);
quiver(0, 0, lambda2_e2C(1), lambda2_e2C(2), 0, 'm', 'LineWidth', 1.5);

legend('h(C)', 'e_1', 'e_2', '\lambda_1 e_1', '\lambda_2 e_2');
hold off;

% Sauvegarde des figures
saveas(figure(1), 'image_f_cercle.png');
saveas(figure(2), 'image_g_cercle.png');
saveas(figure(3), 'image_h_cercle.png');
