#!/usr/bin/sh

install()
{
  echo "Creating dev environment...!!"
  sed  's/__env__/dev/g;s/__port__/30001/g'  template.yaml > deploy-dev.yaml
  kubectl create -f deploy-dev.yaml
  echo "Sleeping for 5 seconds...!!\n"
  sleep 5

  echo "Creating test environment...!!"
  sed  's/__env__/test/g;s/__port__/30002/g'  template.yaml > deploy-test.yaml
  kubectl create -f deploy-test.yaml
  echo "Sleeping for 5 seconds...!!\n"
  sleep 5

  echo "Creating staging environment...!!"
  sed  's/__env__/staging/g;s/__port__/30003/g'  template.yaml > deploy-staging.yaml
  kubectl create -f deploy-staging.yaml
  echo "Sleeping for 5 seconds...!!\n"
  sleep 5
}

uninstall()
{
  echo "Deleting dev environment along with its resources"
  kubectl delete -f deploy-dev.yaml
  
  echo "Deleting test environment along with its resources"
  kubectl delete -f deploy-test.yaml
  
  echo "Deleting staging environment along with its resources"
  kubectl delete -f deploy-staging.yaml
}


if [ $# -eq 0 ]
then
        echo "Missing options!"
        echo "(run $0 -h for help)"
        echo ""
        exit 0
fi

while getopts "iuh" OPTION; do
        case $OPTION in
                i)
                        install
                        ;;
                u)
                        uninstall
                        ;;
                h)
                        echo "Usage:"
                        echo "utility.sh -h for help"
                        echo "utility.sh -i for installtaion"
                        echo "utility.sh -u for uninstallation"
                        echo ""
                        echo "   -h   help (this output)"
                        exit 0
                        ;;

        esac
done
