from importlib import import_module

def read_requirements(filename):
    with open(filename, 'r') as f:
        return f.readlines()


def get_missing_packages(requirements):
    missing_packages = list()
    requirements = [req.strip() for req in requirements]
    for req in requirements:
        package_name, package_version = req.split("==")
        package_name = package_name.lower()

        try:
            import_module(package_name)
        except ImportError:
            missing_packages.append(package_name)


def main(filepath="requirements.txt"):
    requirements = read_requirements(filepath)
    missing_packages = get_missing_packages(requirements)

    if len(missing_packages) == 0:
        print("Svi potrebni paketi su instalirani")
    elif len(missing_packages) > 20:
        print("Potrebno je pokrenuti pip install -r requirements.txt")
    else:
        for missing in missing_packages:
            print("Potrebno je pokrenuti pip install {}".format(missing))


if __name__ == '__main__':
    main()