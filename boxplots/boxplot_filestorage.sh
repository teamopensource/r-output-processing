# Baseline
echo "Baseline:"
/usr/bin/Rscript boxplot9.r "results/NFS/131206-1842-quiz-50/quiz-50.out" "results/NFS/131212-1649-upload-100/upload-100.out" "results/aggregated/baselines-boxplot.svg" "NFS"

# NFS
echo "NFS:"
/usr/bin/Rscript boxplot4.r "results/NFS/131206-1842-quiz-50/quiz-50.out" "results/NFS/131206-1834-quiz-100/quiz-100.out" "results/NFS/131206-1846-quiz-150/quiz-150.out" "results/aggregated/nfs-quiz-boxplot.svg" "NFS"

# Memcached
echo "Memcached:"
/usr/bin/Rscript boxplot4.r "results/Memcached/131206-2023-quiz-50/quiz-50.out" "results/Memcached/131206-2026-quiz-100/quiz-100.out" "results/Memcached/131206-2030-quiz-150/quiz-150.out" "results/aggregated/memcached-quiz-boxplot.svg" "Memcached"

# APC
echo "APC:"
/usr/bin/Rscript boxplot4.r "results/APC/131206-1910-quiz-50/quiz-50.out" "results/APC/131206-2100-quiz-100/quiz-100.out" "results/APC/131206-2109-quiz-150/quiz-150.out" "results/aggregated/apc-quiz-boxplot.svg" "APC"

# Comparison
echo "Comparison:"
/usr/bin/Rscript boxplot5.r "results/APC/131206-2109-quiz-150/quiz-150.out" "results/Memcached/131206-2030-quiz-150/quiz-150.out" "results/NFS/131206-1846-quiz-150/quiz-150.out" "results/aggregated/comp-quiz-boxplot.svg" "Setup comparison"

# Upload comparison
echo "Upload Comparison:"
/usr/bin/Rscript boxplot6.r  "results/APC/131212-1723-upload-150/upload-150.out" "results/Memcached/131212-1713-upload-150/upload-150.out" "results/NFS/131212-1715-upload-150/upload-150.out" "results/aggregated/comp-upload-boxplot.svg" "Setup comparison"