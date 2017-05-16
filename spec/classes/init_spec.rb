require 'spec_helper'

describe 'concat_example' do
  [false, true].each do |collector|
    context "with collector => #{collector}" do
      let :params do
        {:collector => collector}
      end

      it { is_expected.to contain_file('/tmp/dependency').that_comes_before('Concat::Fragment[logging]') }
      it { is_expected.to contain_concat__fragment('logging').that_comes_before('Concat[/tmp/example]') }
      # Transitive dependency
      it { is_expected.to contain_file('/tmp/dependency').that_comes_before('Concat[/tmp/example]') }

      it { is_expected.to contain_concat('/tmp/example').that_comes_before('Exec[dummy service]') }
      # Transitive dependency
      it { is_expected.to contain_file('/tmp/dependency').that_comes_before('Exec[dummy service]') }
    end
  end
end
