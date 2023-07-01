
#dashboard_init:
#	@make -C dashboard/opensearch_provider/ init
#
#dashboard_apply: dashboard_init
#	@make -C dashboard/opensearch_provider/ apply
#
#dashboard_destroy: dashboard_init
#	@make -C dashboard/opensearch_provider/ destroy

dashboard_init:
	@make -C dashboard/phillbaker_provider/ init

dashboard_apply: dashboard_init
	@make -C dashboard/phillbaker_provider/ apply

dashboard_destroy: dashboard_init
	@make -C dashboard/phillbaker_provider/ destroy


index_init:
	@make -C init/index_setup/ init

index_setup: index_init
	@make -C init/index_setup/ apply

index_destroy: index_init
	@make -C init/index_setup/ destroy

patterns_init:
	@make -C init/dashboard_setup/ init

patterns_setup: patterns_init
	@make -C init/dashboard_setup/ apply

patterns_destroy: patterns_init
	@make -C init/dashboard_setup/ destroy
