TERMUX_PKG_HOMEPAGE=https://github.com/yaml/pyyaml
TERMUX_PKG_DESCRIPTION="Python YAML parser and emitter (Cython + libyaml)"
TERMUX_PKG_LICENSE="MIT"
TERMUX_PKG_MAINTAINER="@S0methingSomething"
TERMUX_PKG_VERSION=6.0.3
TERMUX_PKG_SRCURL=https://files.pythonhosted.org/packages/05/8e/961c0007c59b8dd7729d542c61a4d537767a59645b82a0b521206e1e25c2/pyyaml-6.0.3.tar.gz
TERMUX_PKG_SHA256=d76623373421df22fb4cf8817020cbb7ef15c725b9d5e45f17e189bfc384190f
TERMUX_PKG_DEPENDS="libyaml, python, python-pip"
TERMUX_PKG_BUILD_IN_SRC=true
TERMUX_PKG_PYTHON_COMMON_BUILD_DEPS="wheel, Cython"
TERMUX_PKG_PYTHON_CROSS_BUILD_DEPS="Cython"
TERMUX_PKG_AUTO_UPDATE=false

termux_step_make() {
	mkdir -p dist
	cross-pip wheel --no-deps --no-build-isolation -w dist/ .
}

termux_step_make_install() {
	cross-pip install --no-deps --prefix="$TERMUX_PREFIX" --force-reinstall dist/*.whl
}

termux_step_post_make_install() {
	local _stash="$HOME/wheel-stash"
	mkdir -p "$_stash"
	cp -v dist/*.whl "$_stash/" 2>/dev/null || true
}
