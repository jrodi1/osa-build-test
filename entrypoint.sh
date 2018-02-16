cd $HOME
source /root/osa11_init.sh

find $ISDC_ENV/ -executable -or -name '*.so.*' -exec ldd '{}' \; | awk '{print $1}' | sort -u

export COMMONSCRIPT=1

og_create

ibis_science_analysis
