module Fluent
    class OrderOutput < Fluent::Output
        Fluent::Plugin.register_output('order', self)

        config_param :add_tag_prefix, :string, :default => nil
        config_param :after_order_keys, :string, :default => nil

        def configure(conf)
            super

            @add_tag_prefix = conf['add_tag_prefix']
            if @add_tag_prefix.nil?
                raise Fluent::ConfigError, "add_tag_prefix is required!"
            end

            @after_order_keys = conf["after_order_keys"]
            if @after_order_keys.nil?
                raise Fluent::ConfigError, "after_order_keys is required!"
            end

            @after_order_keys = @after_order_keys.split(',');
            unless @after_order_keys.count > 0
                raise Fluent::ConfigError, "after_order_keys is invalied! after_order_keys=#{@after_order_keys}"
            end
        end

        def emit(tag, es, chain)
            es.each { |time, record|
                chain.next

                new_record = _order_record(record);

                Fluent::Engine.emit("#{@add_tag_prefix}.#{tag}", time, new_record)
            }
        end

        private

        # after_order_keysに指定された順に要素を並び替えます
        # @param [Hash] old_record 元のレコード
        # @return [Hash] 要素並び替え後のレコード
        def _order_record(old_record)
            new_record = {}

            @after_order_keys.each { |after_order_key|
                old_record_val = old_record[after_order_key]
                if old_record_val.nil?
                    raise "key that is specified in the after_order_keys can not be found! after_order_key=#{after_order_key}"
                end

                new_record[after_order_key] = old_record_val;
            }

            unless old_record.count == new_record.count
                raise "number of elements of order after order and before do not match! before elements count=#{old_record.count},after elements count=#{new_record.count}."
            end

            return new_record
        end
    end
end