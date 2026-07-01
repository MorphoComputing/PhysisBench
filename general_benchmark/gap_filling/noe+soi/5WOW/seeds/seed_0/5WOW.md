# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\5WOW\sequence\5WOW.pdb`
- output_pdb: `general_benchmark\gap_filling\noe+soi\5WOW\seeds\seed_0\5WOW.pdb`
- residues: 37
- mode: refinement
- ca_rmsd: 7.072 A
- tm_score_ca_ordered: 0.12216920448038238
- heavy_atom_rmsd: 8.105 A
- sidechain_heavy_atom_rmsd: 8.950 A
- **all-atom quality (honest):** heavy 8.105 A, sidechain 8.950 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 3/3
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/31 (0.0)
- lj_severe: 0
- lj_near: 10
- distogram_pairs: 176
- bin_accuracy: 0.341

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `LOW_CONFLICT` (descriptive) — few restraint conflicts — the input is broadly consistent with the fold the engine reached (no actionable input defect surfaced)
- **root cause(s):** C28-Y30 → 11 conflicts (69%)
- explained: 11/16 conflicts by 1 root cause(s)
- metrics: hubs=8 (frac 0.216), conflicts/hub=2.0, max_incompat=4.29Å, chain_span=0.784
- **fix-first:** [LOW_CONFLICT] Root cause(s): C28-Y30 — explain ~11/16 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **C28** — severity 8.26, 5 conflict(s); suspect input ~`Q8` (group: pull_in)
  - pull-in (wants closer): Q8@3.8Å(now 9.2,conf 0.58)
  - push-out (wants farther): I21@6.4Å(now 3.8,conf 0.52), P35@16.0Å(now 11.7,conf 0.26)
  - G24↔Q8: targets 7.3/3.8Å but partners are 15.4Å apart → too_far_apart by 4.3Å
  - N25↔Q8: targets 9.1/3.8Å but partners are 16.6Å apart → too_far_apart by 3.7Å
  - Q8↔R23: targets 3.8/4.4Å but partners are 12.1Å apart → too_far_apart by 4.0Å
- **Y30** — severity 5.62, 4 conflict(s); suspect input ~`G24` (group: pull_in)
  - pull-in (wants closer): C3@3.8Å(now 8.7,conf 0.58)
  - push-out (wants farther): Y27@8.2Å(now 5.4,conf 0.69), Y37@16.7Å(now 14.0,conf 0.49)
  - C3↔G24: targets 3.8/7.7Å but partners are 14.8Å apart → too_far_apart by 3.2Å
  - N25↔C3: targets 11.0/3.8Å but partners are 17.6Å apart → too_far_apart by 2.8Å
  - C3↔R23: targets 3.8/7.0Å but partners are 13.3Å apart → too_far_apart by 2.5Å
- **C20** — severity 1.38, 1 conflict(s); suspect input ~`G29` (group: push_out)
  - push-out (wants farther): G26@12.2Å(now 8.8,conf 0.69), Y27@9.6Å(now 4.0,conf 0.69), G24@11.9Å(now 9.2,conf 0.67)
  - G24↔G29: targets 11.9/4.9Å but partners are 3.2Å apart → too_close_together by 3.9Å
- **Q8** — severity 1.38, 2 conflict(s); suspect input ~`G1` (group: pull_in)
  - pull-in (wants closer): C28@3.8Å(now 9.2,conf 0.58)
  - push-out (wants farther): V2@12.5Å(now 9.4,conf 0.52), R12@7.6Å(now 5.0,conf 0.52), G1@13.4Å(now 9.7,conf 0.43)
  - C28↔G1: targets 3.8/13.4Å but partners are 7.2Å apart → too_close_together by 2.3Å
  - V2↔C16: targets 12.5/5.7Å but partners are 5.2Å apart → too_close_together by 1.6Å
- **C3** — severity 1.12, 1 conflict(s); suspect input ~`Y30` (group: push_out)
  - pull-in (wants closer): Y30@3.8Å(now 8.7,conf 0.58)
  - push-out (wants farther): L7@9.0Å(now 5.9,conf 0.40)
  - I6↔Y30: targets 9.6/3.8Å but partners are 15.3Å apart → too_far_apart by 1.9Å
- **C22** — severity 0.96, 1 conflict(s); suspect input ~`G29` (group: pull_in)
  - pull-in (wants closer): A19@8.3Å(now 11.0,conf 0.67), D13@4.1Å(now 8.8,conf 0.43), G29@4.5Å(now 8.4,conf 0.39)
  - D13↔G29: targets 4.1/4.5Å but partners are 11.1Å apart → too_far_apart by 2.5Å

## Secondary Structure (DSSP-like)

- helix(H)=18 · strand(E)=16 · 3-10(G)=3 · coil(C)=0

```
EHHHEHHEEEHHHHHEGHGEHHEHHEHEHEEEGEEHE
```

## Backbone H-bond Network

- total=59 · helix(i→i+4)=8 · sheet=51
  - V2 ↔ I6  (helix)
  - C3 ↔ L7  (helix)
  - L7 ↔ R11  (helix)
  - R11 ↔ D15  (helix)
  - S14 ↔ G18  (helix)
  - G18 ↔ C22  (helix)
  - I21 ↔ N25  (helix)
  - N25 ↔ G29  (helix)
  - G1 ↔ Q8  (sheet)
  - G1 ↔ R9  (sheet)
  - G1 ↔ C10  (sheet)
  - G1 ↔ C16  (sheet)
  - G1 ↔ C20  (sheet)
  - K5 ↔ C10  (sheet)
  - K5 ↔ C16  (sheet)
  - K5 ↔ C20  (sheet)
  - Q8 ↔ C16  (sheet)
  - Q8 ↔ C20  (sheet)
  - Q8 ↔ R23  (sheet)
  - Q8 ↔ G26  (sheet)
  - … +39 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=11 · exposed=13 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=206 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=126 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=4.7689 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=10 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Disulfide Bonds Formed

- count=3: C3–C20, C10–C22, C16–C28

## Side-chain Rotamers (χ1/χ2)

- 31 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
