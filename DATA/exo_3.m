% Charger la matrice A
load('Ex1.mat'); % On suppose que la matrice A est dans ce fichier

% Diagonaliser A pour obtenir valeurs propres et vecteurs propres
[P, D] = eig(A);
lambda = diag(D); % Valeurs propres
lambda1 = lambda(1);
lambda2 = lambda(2);

% Générer les points du cercle unité pour la norme ‖·‖ₐ
t = linspace(0, 2*pi, 100);
x_prime = cos(t)./sqrt(lambda1);
y_prime = sin(t)./sqrt(lambda2);

% Convertir en coordonnées dans la base canonique
points = zeros(2, length(t));
for i = 1:length(t)
    % X = P * X'
    points(:,i) = P * [x_prime(i); y_prime(i)];
end

% Tracer le cercle unité
figure;
plot(points(1,:), points(2,:), 'b', 'LineWidth', 2);
hold on;
grid on;
axis equal;
title('Cercle unité pour la norme définie par A');
xlabel('x');
ylabel('y');

% Tracer aussi les vecteurs propres
quiver(0, 0, P(1,1), P(2,1), 'r', 'LineWidth', 1.5);
quiver(0, 0, P(1,2), P(2,2), 'r', 'LineWidth', 1.5);
legend('Cercle unité ‖·‖ₐ', 'e₁', 'e₂');
