RUN_UNIT_TESTS_WORKFLOW_TEMPLATE=$(cat .github/workflows/run-unit-tests-template.yaml)

for NAME in $(ls apps); do
    echo "generating workflow for apps/${NAME}"
    WORKFLOW=$(echo "${RUN_UNIT_TESTS_WORKFLOW_TEMPLATE}" | sed "s/{{NAME}}/apps\/${NAME}/g")
    echo "${WORKFLOW}" > .github/workflows/run-unit-tests-${NAME}.yaml
done

for NAME in $(ls libs); do
    echo "generating workflow for libs/${NAME}"
    WORKFLOW=$(echo "${RUN_UNIT_TESTS_WORKFLOW_TEMPLATE}" | sed "s/{{NAME}}/libs\/${NAME}/g")
    echo "${WORKFLOW}" > .github/workflows/run-unit-tests-${NAME}.yaml
done