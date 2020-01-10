# docker image for rest-api

DOCKER_RESTAPI_STEM = docker-sonic-restapi
DOCKER_RESTAPI = $(DOCKER_RESTAPI_STEM).gz

$(DOCKER_RESTAPI)_DEPENDS += $(LIBHIREDIS) $(LIBNL3) $(LIBNL_GENL3) \
                             $(LIBNL_ROUTE3) $(LIBSWSSCOMMON) $(RESTAPI)

$(DOCKER_RESTAPI)_PATH = $(DOCKERS_PATH)/$(DOCKER_RESTAPI_STEM)

$(DOCKER_RESTAPI)_LOAD_DOCKERS += $(DOCKER_CONFIG_ENGINE_STRETCH)

SONIC_DOCKER_IMAGES += $(DOCKER_RESTAPI)
SONIC_STRETCH_DOCKERS += $(DOCKER_RESTAPI)
SONIC_INSTALL_DOCKER_IMAGES += $(DOCKER_RESTAPI)

$(DOCKER_RESTAPI)_CONTAINER_NAME = rest-api
$(DOCKER_RESTAPI)_RUN_OPT += --cap-add NET_ADMIN --privileged -t
$(DOCKER_RESTAPI)_RUN_OPT += -v /var/run/redis/redis.sock:/var/run/redis/redis.sock
$(DOCKER_RESTAPI)_RUN_OPT += -p=8090:8090/tcp
