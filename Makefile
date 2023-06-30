
init:
	@make -C opensearch_provider/ init

apply: init
	@make -C opensearch_provider/ apply

destroy: init
	@make -C opensearch_provider/ destroy

index_init:
	@make -C init/index_setup/ init

index_setup: index_init
	@make -C init/index_setup/ apply

index_destroy: index_init
	@make -C init/index_setup/ destroy

dashboard_init:
	@make -C init/dashboard_setup/ init

dashboard_setup: dashboard_init
	@make -C init/dashboard_setup/ apply

dashboard_destroy: dashboard_init
	@make -C init/dashboard_setup/ destroy

