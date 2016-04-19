require 'spec_helper'

describe CamtParser::Format053::AccountBalance do
  let(:camt)       { CamtParser::File.parse('spec/fixtures/valid_example.xml') }
  let(:statements) { camt.statements }
  let(:ex_stmt)    { camt.statements[0] }
  subject { ex_stmt.opening_balance }

  specify { expect(subject.currency).to eq "EUR" }
  specify { expect(subject.date).to eq Date.new(2013,12,27) }
  specify { expect(subject.sign).to eq 1 }
  specify { expect(subject.credit?).to be_truthy }
  specify { expect(subject.amount).to eq BigDecimal.new("33.06") }
  specify { expect(subject.amount_in_cents).to eq 3306 }
end