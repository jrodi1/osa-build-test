cd $HOME
source /root/osa11_init.sh

find $ISDC_ENV/ -executable -or -name '*.so.*' -exec ldd '{}' \; | awk '{print $1}' | sort -u

export COMMONSCRIPT=1

cd /data/rep_base_prod
ls /data/rep_base_prod/scw/0665/

export REP_BASE_PROD=$PWD
export ISDC_REF_CAT="$PWD/cat/hec/gnrl_refr_cat_0040.fits[1]"

echo '178400230010.001' > scw.list

ls -lotr /data/rep_base_prod/idx/ic/

export COMMONSCRIPT=1
export COMMONLOGFILE=+log

og_create idxSwg=scw.list instrument=IBIS ogid=test_ogid baseDir=tests

cd tests/obs/test_ogid

ibis_science_analysis  \
    startLevel="COR" \
    endLevel="IMA"
