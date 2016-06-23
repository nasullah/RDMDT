'use strict';

System.register(['aurelia-framework'], function (_export, _context) {
    "use strict";

    var bindable, _desc, _value, _class, _descriptor, _descriptor2, RepeatingInput;

    function _initDefineProp(target, property, descriptor, context) {
        if (!descriptor) return;
        Object.defineProperty(target, property, {
            enumerable: descriptor.enumerable,
            configurable: descriptor.configurable,
            writable: descriptor.writable,
            value: descriptor.initializer ? descriptor.initializer.call(context) : void 0
        });
    }

    function _classCallCheck(instance, Constructor) {
        if (!(instance instanceof Constructor)) {
            throw new TypeError("Cannot call a class as a function");
        }
    }

    function _applyDecoratedDescriptor(target, property, decorators, descriptor, context) {
        var desc = {};
        Object['ke' + 'ys'](descriptor).forEach(function (key) {
            desc[key] = descriptor[key];
        });
        desc.enumerable = !!desc.enumerable;
        desc.configurable = !!desc.configurable;

        if ('value' in desc || desc.initializer) {
            desc.writable = true;
        }

        desc = decorators.slice().reverse().reduce(function (desc, decorator) {
            return decorator(target, property, desc) || desc;
        }, desc);

        if (context && desc.initializer !== void 0) {
            desc.value = desc.initializer ? desc.initializer.call(context) : void 0;
            desc.initializer = undefined;
        }

        if (desc.initializer === void 0) {
            Object['define' + 'Property'](target, property, desc);
            desc = null;
        }

        return desc;
    }

    function _initializerWarningHelper(descriptor, context) {
        throw new Error('Decorating class property failed. Please ensure that transform-class-properties is enabled.');
    }

    return {
        setters: [function (_aureliaFramework) {
            bindable = _aureliaFramework.bindable;
        }],
        execute: function () {
            _export('RepeatingInput', RepeatingInput = (_class = function () {
                function RepeatingInput() {
                    _classCallCheck(this, RepeatingInput);

                    _initDefineProp(this, 'prefix', _descriptor, this);

                    _initDefineProp(this, 'label', _descriptor2, this);

                    this.items = [1];
                }

                RepeatingInput.prototype.addItem = function addItem() {
                    this.items.push(this.items[this.items.length - 1] + 1);
                };

                RepeatingInput.prototype.removeItem = function removeItem() {
                    if (this.items.length > 1) {
                        this.items.pop();
                    }
                };

                return RepeatingInput;
            }(), (_descriptor = _applyDecoratedDescriptor(_class.prototype, 'prefix', [bindable], {
                enumerable: true,
                initializer: function initializer() {
                    return '';
                }
            }), _descriptor2 = _applyDecoratedDescriptor(_class.prototype, 'label', [bindable], {
                enumerable: true,
                initializer: function initializer() {
                    return '';
                }
            })), _class));

            _export('RepeatingInput', RepeatingInput);
        }
    };
});
//# sourceMappingURL=repeating-input.js.map
