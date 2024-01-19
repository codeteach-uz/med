package com.dataprizma.webapp.controller;

import com.dataprizma.model.*;
import com.dataprizma.service.PersonCardManager;
import com.dataprizma.service.RegionManager;
import com.dataprizma.webapp.controller.editor.RegionEditor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.Date;
import java.util.List;
import java.util.Random;

/**
 * Created by Admin on 28/02/2015.
 */
@Controller
public class PersonCardFormController extends BaseFormController {
    private PersonCardManager personCardManager;
    private RegionManager regionManager;
    private RegionEditor regionEditor;

    @Autowired
    public void setRegionManager(RegionManager regionManager) {
        this.regionManager = regionManager;
    }

    @Autowired
    public void setRegionEditor(RegionEditor regionEditor) {
        this.regionEditor = regionEditor;
    }

    @Autowired
    public void setPersonCardManager(PersonCardManager personCardManager) {
        this.personCardManager = personCardManager;
    }

    @RequestMapping(value = "/personcardform", method = RequestMethod.GET)
    protected ModelAndView showForm(@RequestParam(required = false) Long id) throws Exception {
        PersonCard personCard;
        personCard = (id != null) ? personCardManager.get(id) : new PersonCard();
        return new ModelAndView("personcardform", "personCard", personCard);
    }

    @RequestMapping(value = "/personcardform", method = RequestMethod.POST)
    public ModelAndView onSubmit(PersonCard personCard, BindingResult errors,
                                 HttpServletRequest request) throws Exception {

        if (request.getParameter("cancel") != null) {
            return new ModelAndView("redirect:/personcards");
        }

        if (request.getParameter("delete") != null && personCard.getId() != null) {
            try {
                personCardManager.remove(personCard);
                saveMessage(request, getText("personCard.deleted", request.getLocale()));
            } catch (Exception e) {
                saveError(request, getText("personCard.notdeleted", request.getLocale()));
                return new ModelAndView("redirect:/personcards");
            }
            return new ModelAndView("redirect:/personcards");
        }

        //calculate total
        int total = getTotal(personCard);
        personCard.getTestTexas().setTotal(total);

        //calc ZOS
        double zos = calcZOS(personCard);
        double bioAge = 0;
        double dbv = 0;
        double sad = (personCard.getSad() != null) ? personCard.getSad() : 0;
        double dad = (personCard.getDad() != null) ? personCard.getDad() : 0;
        int zdv = (personCard.getZdv() != null) ? personCard.getZdv() : 0;
        int sb = (personCard.getStaticBalance() != null) ? personCard.getStaticBalance() : 0;
        double adp = (personCard.getAdp() != null) ? personCard.getAdp() : 0;
        double massBody = (personCard.getMassBody() != null) ? personCard.getMassBody() : 0;
        double age = (personCard.getAge() != null) ? personCard.getAge() : 0;
        int sex = personCard.getSex();

        if (sex == 1) {
            bioAge = (26.985 + 0.215 * sad - 0.149 * zdv - 0.151 * sb + 0.723 * zos);
            dbv = (int) (0.629 * age + 18.56);
        } else {
            bioAge = (-1.463 + 0.415 * adp - 0.141 * sb + 0.248 * massBody + 0.694 * zos);
            dbv = 0.58 * age + 17.24;
        }

        personCard.getTestTexas().setBiologicAge((int) bioAge);
        personCard.getTestTexas().setDbv((int) dbv);

        // psix test
        double average = getPsixAvg(personCard);
        personCard.getTestPsix().setAverg(average);
        double res = 4 - average;
        int urovenStress = 0;
        if (sex == 1) {
            if (res >= 2 && res <= 3) {
                urovenStress = 1;
            } else if (res >= 1 && res < 2) {
                urovenStress = 2;
            } else {
                urovenStress = 3;
            }
        } else {
            if (res >= 2.18 && res <= 3) {
                urovenStress = 1;
            } else if (res >= 1.18 && res < 2.18) {
                urovenStress = 2;
            } else {
                urovenStress = 3;
            }
        }

        personCard.getTestPsix().setUrovenStress(urovenStress);

        double puls = (personCard.getPulse() != null) ? personCard.getPulse() : 0;
        double ads = (personCard.getAds() != null) ? personCard.getAds() : 0;
        int height = personCard.getHeight();
        double ifs = (700 - 3 * puls - 2.5 * ads - 2.7 * age + 0.28 * massBody) / (350 - 2.6 * age + 0.21 * height);
        ifs = ((double) Math.round(ifs * 1000)) / 1000;
        personCard.getTestPsix().setIfs(ifs);

        Integer ufs = 0;
        if (ifs < 0.376) {
            ufs += sex;
        } else if (ifs >= 0.376 && ifs <= 0.525) {
            ufs += (sex + 1);
        } else if (ifs >= 0.526 && ifs <= 0.675) {
            ufs += (sex + 2);
        } else if (ifs >= 0.676 && ifs <= 0.825) {
            ufs += (sex + 3);
        } else if(ifs>0.825){
            ufs += (sex + 4);
        }

        personCard.getTestPsix().setUfs(ufs);

        // calc ap
        double ap = 0;
        ap = 0.0011 * puls + 0.014 * sad + 0.008 * dad + 0.009 * massBody - 0.009 * height + 0.014 * age - 0.27;
        ap = ((double) Math.round(ap * 100) / 100);
        personCard.getTestPsix().setAp(ap);
        int apType = 1;
        if (ap < 2.6) {
            apType = 1;
        } else if (ap >= 2.6 && ap <= 3.09) {
            apType = 2;
        } else if (ap > 3.09 && ap <= 3.49) {
            apType = 3;
        } else {
            apType = 4;
        }

        personCard.getTestPsix().setApType(apType);

        if (personCard.getId() == null) {
            personCard.setDateOfSaved(new Date());
        }
		
/*
TODO: Sogliq indeksini modelini implement qilish kerak (Ignateevni monografiyasidan), 
pastdagi HealthIndex random tanlangan. 
*/

        if (personCard.getHealthIndex()==null || personCard.getHealthIndex()<10){
            Random random = new Random();
            int delta = random.nextInt(20);
            if (personCard.getLabel() == 1) {
                personCard.setHealthIndex(40 + delta);
            } else if (personCard.getLabel() == 2) {
                personCard.setHealthIndex(75 + delta);
            } else if (personCard.getLabel() == 3) {
                personCard.setHealthIndex(60 + delta);
            }
        }


        personCard = personCardManager.save(personCard);
        saveMessage(request, getText("personCard.saved", request.getLocale()));

        return new ModelAndView("redirect:/personcardform?id=" + personCard.getId());
    }

    @ModelAttribute("regionList")
    protected List<Region> regionList() {
        return regionManager.getAll();
    }

    @InitBinder
    public void initBinder(WebDataBinder binder) {
        binder.registerCustomEditor(Region.class, regionEditor);
    }

    private Double calcZOS(PersonCard personCard) {
        Double sum = 0d;
        int count = 0;
        TestTable testTable = null;
        if (personCard.getTestTable() != null) {
            testTable = personCard.getTestTable();
        } else {
            return 0d;
        }

        if (testTable.getTest1() != null) {
            sum += testTable.getTest1();
            count++;
        }

        if (testTable.getTest2() != null) {
            sum += testTable.getTest2();
            count++;
        }
        if (testTable.getTest3() != null) {
            sum += testTable.getTest3();
            count++;
        }
        if (testTable.getTest4() != null) {
            sum += testTable.getTest4();
            count++;
        }
        if (testTable.getTest5() != null) {
            sum += testTable.getTest5();
            count++;
        }
        if (testTable.getTest6() != null) {
            sum += testTable.getTest6();
            count++;
        }
        if (testTable.getTest7() != null) {
            sum += testTable.getTest7();
            count++;
        }
        if (testTable.getTest8() != null) {
            sum += testTable.getTest8();
            count++;
        }
        if (testTable.getTest9() != null) {
            sum += testTable.getTest9();
            count++;
        }
        if (testTable.getTest10() != null) {
            sum += testTable.getTest10();
            count++;
        }
        if (testTable.getTest11() != null) {
            sum += testTable.getTest11();
            count++;
        }
        if (testTable.getTest12() != null) {
            sum += testTable.getTest12();
            count++;
        }
        if (testTable.getTest13() != null) {
            sum += testTable.getTest13();
            count++;
        }
        if (testTable.getTest14() != null) {
            sum += testTable.getTest14();
            count++;
        }
        if (testTable.getTest15() != null) {
            sum += testTable.getTest15();
            count++;
        }
        if (testTable.getTest16() != null) {
            sum += testTable.getTest16();
            count++;
        }
        if (testTable.getTest17() != null) {
            sum += testTable.getTest17();
            count++;
        }
        if (testTable.getTest18() != null) {
            sum += testTable.getTest18();
            count++;
        }
        if (testTable.getTest19() != null) {
            sum += testTable.getTest19();
            count++;
        }
        if (testTable.getTest20() != null) {
            sum += testTable.getTest20();
            count++;
        }
        if (testTable.getTest21() != null) {
            sum += testTable.getTest21();
            count++;
        }
        if (testTable.getTest22() != null) {
            sum += testTable.getTest22();
            count++;
        }
        if (testTable.getTest23() != null) {
            sum += testTable.getTest23();
            count++;
        }
        if (testTable.getTest24() != null) {
            sum += testTable.getTest24();
            count++;
        }
        if (testTable.getTest25() != null) {
            sum += testTable.getTest25();
            count++;
        }
        if (testTable.getTest26() != null) {
            sum += testTable.getTest26();
            count++;
        }
        if (testTable.getTest27() != null) {
            sum += testTable.getTest27();
            count++;
        }
        if (testTable.getTest28() != null) {
            sum += testTable.getTest28();
            count++;
        }
        if (testTable.getTest29() != null) {
            sum += testTable.getTest29();
            count++;
        }

        if (count != 0) {
            return sum;
        }
        return 0d;

    }

    private int getTotal(PersonCard personCard) {
        int sum = 0;
        TestTexas testTexas = null;
        if (personCard.getTestTexas() != null) {
            testTexas = personCard.getTestTexas();
        } else {
            return 0;
        }

        if (testTexas.getAnswer1() != null) {
            sum += testTexas.getAnswer1();
        }

        if (testTexas.getAnswer2() != null) {
            sum += testTexas.getAnswer2();
        }
        if (testTexas.getAnswer3() != null) {
            sum += testTexas.getAnswer3();
        }
        if (testTexas.getAnswer4() != null) {
            sum += testTexas.getAnswer4();
        }
        if (testTexas.getAnswer5() != null) {
            sum += testTexas.getAnswer5();
        }
        if (testTexas.getAnswer6() != null) {
            sum += testTexas.getAnswer6();
        }
        if (testTexas.getAnswer7() != null) {
            sum += testTexas.getAnswer7();
        }
        if (testTexas.getAnswer8() != null) {
            sum += testTexas.getAnswer8();
        }
        if (testTexas.getAnswer9() != null) {
            sum += Math.abs(testTexas.getAnswer9());
        }

        return sum;

    }

    private double getPsixAvg(PersonCard personCard) {
        double sum = 0;
        int count = 0;
        TestPsix testPsix = null;
        if (personCard.getTestPsix() != null) {
            testPsix = personCard.getTestPsix();
        }

        if (testPsix.getQues1() != null) {
            sum += testPsix.getQues1();
            count++;
        }
        if (testPsix.getQues2() != null) {
            sum += testPsix.getQues2();
            count++;
        }
        if (testPsix.getQues3() != null) {
            sum += testPsix.getQues3();
            count++;
        }
        if (testPsix.getQues4() != null) {
            sum += testPsix.getQues4();
            count++;
        }
        if (testPsix.getQues5() != null) {
            sum += testPsix.getQues5();
            count++;
        }
        if (testPsix.getQues6() != null) {
            sum += testPsix.getQues6();
            count++;
        }
        if (testPsix.getQues7() != null) {
            sum += testPsix.getQues7();
            count++;
        }

        if (count != 0) {
            return ((double) Math.round(100 * sum / count)) / 100;
        }
        return 0;
    }


}
