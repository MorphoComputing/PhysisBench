# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\1EGF\sequence\1EGF.pdb`
- output_pdb: `general_benchmark\experimental_restraints\nmr_star\1EGF\seeds\seed_0\1EGF.pdb`
- residues: 51
- mode: refinement
- ca_rmsd: 6.786 A
- tm_score_ca_ordered: 0.2007581382496492
- heavy_atom_rmsd: 8.609 A
- sidechain_heavy_atom_rmsd: 10.110 A
- **all-atom quality (honest):** heavy 8.609 A, sidechain 10.110 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 3/3
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/45 (0.0)
- lj_severe: 0
- lj_near: 24
- distogram_pairs: 97
- bin_accuracy: 0.371

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `LOW_CONFLICT` (descriptive) — few restraint conflicts — the input is broadly consistent with the fold the engine reached (no actionable input defect surfaced)
- **root cause(s):** C41-D45 → 7 conflicts (54%)
- explained: 7/13 conflicts by 1 root cause(s)
- metrics: hubs=9 (frac 0.176), conflicts/hub=1.4, max_incompat=8.43Å, chain_span=0.627
- **fix-first:** [LOW_CONFLICT] Root cause(s): C41-D45 — explain ~7/13 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **S37** — severity 3.76, 2 conflict(s); suspect input ~`D45` (group: pull_in)
  - pull-in (wants closer): D45@3.5Å(now 6.7,conf 0.64)
  - I34↔D45: targets 3.3/3.5Å but partners are 10.5Å apart → too_far_apart by 3.7Å
  - D45↔G35: targets 3.5/3.8Å but partners are 9.7Å apart → too_far_apart by 2.4Å
- **M20** — severity 3.13, 1 conflict(s); suspect input ~`N31` (group: pull_in)
  - pull-in (wants closer): N31@3.5Å(now 6.9,conf 0.64)
  - P6↔N31: targets 3.4/3.5Å but partners are 11.8Å apart → too_far_apart by 4.9Å
- **N31** — severity 2.70, 2 conflict(s); suspect input ~`C41` (group: pull_in)
  - pull-in (wants closer): L14@3.4Å(now 5.9,conf 0.68), M20@3.5Å(now 6.9,conf 0.64)
  - M20↔C41: targets 3.5/3.8Å but partners are 10.8Å apart → too_far_apart by 3.5Å
  - M20↔R40: targets 3.5/4.9Å but partners are 10.4Å apart → too_far_apart by 1.9Å
- **C13** — severity 1.99, 1 conflict(s); suspect input ~`C41` (group: pull_in)
  - pull-in (wants closer): G11@4.3Å(now 10.2,conf 0.41), C41@5.5Å(now 8.2,conf 0.24)
  - G11↔C41: targets 4.3/5.5Å but partners are 18.3Å apart → too_far_apart by 8.4Å
- **T43** — severity 1.28, 2 conflict(s); suspect input ~`D45` (group: pull_in)
  - pull-in (wants closer): N15@5.5Å(now 11.3,conf 0.24), G16@5.5Å(now 10.9,conf 0.24)
  - N15↔D45: targets 5.5/6.1Å but partners are 15.6Å apart → too_far_apart by 4.0Å
  - G16↔D45: targets 5.5/6.1Å but partners are 13.9Å apart → too_far_apart by 2.2Å
- **I34** — severity 1.09, 2 conflict(s); suspect input ~`G17` (group: pull_in)
  - pull-in (wants closer): G17@6.1Å(now 10.8,conf 0.21), V18@6.1Å(now 9.1,conf 0.21)
  - S37↔G17: targets 3.3/6.1Å but partners are 12.9Å apart → too_far_apart by 3.6Å
  - S37↔V18: targets 3.3/6.1Å but partners are 11.1Å apart → too_far_apart by 1.7Å

## Secondary Structure (DSSP-like)

- helix(H)=29 · strand(E)=17 · 3-10(G)=4 · coil(C)=1

```
EEEHHHHHGHHEHEEHHHEEHEGEHEHEHEHHHEGHGEHHHHHHHHHEEHC
```

## Backbone H-bond Network

- total=73 · helix(i→i+4)=15 · sheet=58
  - G4 ↔ S8  (helix)
  - P6 ↔ D10  (helix)
  - C13 ↔ G17  (helix)
  - G17 ↔ H21  (helix)
  - H21 ↔ L25  (helix)
  - L25 ↔ T29  (helix)
  - S27 ↔ N31  (helix)
  - T29 ↔ V33  (helix)
  - C32 ↔ Y36  (helix)
  - Y36 ↔ R40  (helix)
  - D39 ↔ T43  (helix)
  - R40 ↔ R44  (helix)
  - C41 ↔ D45  (helix)
  - T43 ↔ R47  (helix)
  - L46 ↔ E50  (helix)
  - S1 ↔ Y12  (sheet)
  - S1 ↔ L14  (sheet)
  - S1 ↔ N15  (sheet)
  - S1 ↔ C19  (sheet)
  - S1 ↔ M20  (sheet)
  - … +53 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=22 · exposed=18 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=320 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=186 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=1.8669 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=24 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Disulfide Bonds Formed

- count=3: C5–C19, C13–C30, C32–C41

## Side-chain Rotamers (χ1/χ2)

- 45 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
