document.addEventListener('turbo:load', function() {
  const personForm = document.getElementById('js-person-form');

  if (personForm) {
    const wifeSelector = document.getElementById('js-wife-selector');
    const husbandSelector = document.getElementById('js-husband-selector');
    const genderSelector = document.getElementById('person_gender');
    const marriageDateSelector = document.getElementById('js-marriage-date-selector');
    const wifeSelectInput = document.getElementById('person_wife_id');
    const husbandSelectInput = document.getElementById('person_husband_id');

    const togglePartnerSelectors = () => {
      if (genderSelector.value == 'm') {
        husbandSelector.classList.add('d-none');
        wifeSelector.classList.remove('d-none');
        husbandSelectInput.value = '';
      } else {
        husbandSelector.classList.remove('d-none');
        wifeSelector.classList.add('d-none');
        wifeSelectInput.value = '';
      }
    }

    const toggleMarriageDate = () => {
      const isWife = wifeSelectInput.value != '';
      const isHusband = husbandSelectInput.value != '';

      if (isWife || isHusband) {
        marriageDateSelector.classList.remove('d-none');
      } else {
        marriageDateSelector.classList.add('d-none');
      }
    }

    togglePartnerSelectors(); 
    toggleMarriageDate();
    genderSelector.addEventListener('change', function() {
      togglePartnerSelectors(); 
    });
    husbandSelector.addEventListener('change', function() {
      toggleMarriageDate();
    });
    wifeSelector.addEventListener('change', function() {
      toggleMarriageDate();
    });
  }
})

