
# Apache vs. Nginx
/usr/bin/Rscript boxplot7.r "results/Nginx/2 processes/131213-1253-quiz-25/quiz-25.out" "results/Nginx/2 processes/131213-1404-quiz-30/quiz-30.out" "results/Nginx/2 processes/131213-1343-quiz-40/quiz-40.out" "results/Nginx/2 processes/131213-1256-quiz-50/quiz-50.out" "results/Nginx/2 processes/131213-1347-quiz-75/quiz-75.out" "results/Apache/131213-1324-quiz-25/quiz-25.out" "results/Apache/131213-1407-quiz-30/quiz-30.out" "results/Apache/131213-1339-quiz-40/quiz-40.out" "results/aggregated/webcomp-quiz-boxplot.svg" "Nginx vs. Apache"
echo "Apache vs. Nginx:"

# Nginx configuration
/usr/bin/Rscript boxplot8.r "results/Nginx/2 processes/131213-1253-quiz-25/quiz-25.out" "results/Nginx/2 processes/131213-1256-quiz-50/quiz-50.out" "results/Nginx/4 processes/131213-1308-quiz-25/quiz-25.out" "results/Nginx/4 processes/131213-1305-quiz-50/quiz-50.out" "results/aggregated/nginx-quiz-boxplot.svg" "Nginx configuration"
echo "Nginx configuration:"