FROM artemklevtsov/r-alpine:3.3.1

MAINTAINER PhenoMeNal-H2020 Project ( phenomenal-h2020-users@googlegroups.com )

LABEL software.version="0.5"
LABEL version="0.4.2"
LABEL software="isa_factors_viz"
LABEL base.image="artemklevtsov/r-alpine:3.3.1"
LABEL description="An R-based depiction for factors and their values in ISA studies"
LABEL website="https://github.com/phnmnl/container-mtbls-factors-viz"
LABEL documentation="https://github.com/phnmnl/container-mtbls-factors-viz"
LABEL license="https://github.com/phnmnl/container-mtbls-factors-viz"
LABEL tags="Metabolomics"

RUN R -e "install.packages(c('data.table','optparse','jsonlite','ggparallel'))"

RUN apk add --no-cache --virtual git-deps git openssh \
    && git clone --depth 1 --single-branch -b develop https://github.com/ISA-tools/isatools-galaxy /files/galaxy \
    && apk del git-deps \
    && rm -rf /var/cache/apk/* \
    && rm -rf /tmp/* /var/tmp/*

ADD runTest1.sh /usr/local/bin/runTest1.sh
RUN chmod a+x /usr/local/bin/runTest1.sh

RUN cp /files/galaxy/tools/visualizations/makeParallelCoordsPlot.R /usr/local/bin/makeParallelCoordsPlot.R
RUN chmod a+x /usr/local/bin/makeParallelCoordsPlot.R

ENTRYPOINT ["makeParallelCoordsPlot.R"]
