package net.proselyte.crmsystem.service;

import java.util.Locale;

/**
 * Service for setting Locale.
 *
 * @author Eugene Suleimanov
 */

public interface SetLocaleService {

    void setLocal(Locale local);

    Locale getLocale();
}
