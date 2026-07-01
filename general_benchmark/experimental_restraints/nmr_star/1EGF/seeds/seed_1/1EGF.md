# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\1EGF\sequence\1EGF.pdb`
- output_pdb: `general_benchmark\experimental_restraints\nmr_star\1EGF\seeds\seed_1\1EGF.pdb`
- residues: 51
- mode: refinement
- ca_rmsd: 8.008 A
- tm_score_ca_ordered: 0.1409098483339533
- heavy_atom_rmsd: 9.655 A
- sidechain_heavy_atom_rmsd: 10.714 A
- **all-atom quality (honest):** heavy 9.655 A, sidechain 10.714 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 3/3
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/45 (0.0)
- lj_severe: 0
- lj_near: 22
- distogram_pairs: 97
- bin_accuracy: 0.464

## Failure Classification

- primary_reason: `BACKBONE_TARGET_MISSED`
- reasons: `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `LOW_CONFLICT` (descriptive) — few restraint conflicts — the input is broadly consistent with the fold the engine reached (no actionable input defect surfaced)
- **root cause(s):** T43-L46 → 9 conflicts (60%)
- explained: 9/15 conflicts by 1 root cause(s)
- metrics: hubs=8 (frac 0.157), conflicts/hub=1.9, max_incompat=7.06Å, chain_span=0.588
- **fix-first:** [LOW_CONFLICT] Root cause(s): T43-L46 — explain ~9/15 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **S37** — severity 7.97, 5 conflict(s); suspect input ~`L46` (group: pull_in)
  - pull-in (wants closer): I34@3.3Å(now 6.3,conf 0.71), L46@3.6Å(now 6.5,conf 0.61)
  - I34↔L46: targets 3.3/3.6Å but partners are 12.4Å apart → too_far_apart by 5.5Å
  - I34↔D45: targets 3.3/3.5Å but partners are 11.0Å apart → too_far_apart by 4.2Å
  - L46↔G35: targets 3.6/3.8Å but partners are 9.1Å apart → too_far_apart by 1.6Å
- **E23** — severity 4.20, 2 conflict(s); suspect input ~`Y2` (group: pull_in)
  - pull-in (wants closer): Y2@3.5Å(now 9.3,conf 0.64)
  - Y28↔Y2: targets 3.3/3.5Å but partners are 11.2Å apart → too_far_apart by 4.4Å
  - Y2↔S27: targets 3.5/5.5Å but partners are 14.9Å apart → too_far_apart by 5.9Å
- **C13** — severity 1.67, 1 conflict(s); suspect input ~`C41` (group: pull_in)
  - pull-in (wants closer): C41@5.5Å(now 12.1,conf 0.24)
  - G11↔C41: targets 4.3/5.5Å but partners are 16.9Å apart → too_far_apart by 7.1Å
- **T43** — severity 1.66, 2 conflict(s); suspect input ~`D45` (group: pull_in)
  - pull-in (wants closer): N15@5.5Å(now 8.9,conf 0.24), G16@5.5Å(now 9.1,conf 0.24)
  - G16↔D45: targets 5.5/6.1Å but partners are 15.9Å apart → too_far_apart by 4.3Å
  - N15↔D45: targets 5.5/6.1Å but partners are 15.4Å apart → too_far_apart by 3.8Å
- **I34** — severity 1.28, 2 conflict(s); suspect input ~`G17` (group: pull_in)
  - pull-in (wants closer): S37@3.3Å(now 6.3,conf 0.71)
  - S37↔G17: targets 3.3/6.1Å but partners are 13.5Å apart → too_far_apart by 4.1Å
  - S37↔V18: targets 3.3/6.1Å but partners are 11.5Å apart → too_far_apart by 2.1Å
- **C41** — severity 0.93, 1 conflict(s); suspect input ~`T43` (group: pull_in)
  - pull-in (wants closer): C13@5.5Å(now 12.1,conf 0.24)
  - C13↔T43: targets 5.5/6.1Å but partners are 16.2Å apart → too_far_apart by 4.5Å

## Secondary Structure (DSSP-like)

- helix(H)=23 · strand(E)=14 · 3-10(G)=7 · coil(C)=7

```
CEHEHHHHHHGCEEHHGHHHGEGCHGHEHEEHHGEHHEHHCGCEEEHECHC
```

## Backbone H-bond Network

- total=36 · helix(i→i+4)=9 · sheet=27
  - P3 ↔ S7  (helix)
  - C5 ↔ Y9  (helix)
  - P6 ↔ D10  (helix)
  - N15 ↔ C19  (helix)
  - G16 ↔ M20  (helix)
  - L25 ↔ T29  (helix)
  - T29 ↔ V33  (helix)
  - V33 ↔ S37  (helix)
  - Y36 ↔ R40  (helix)
  - Y2 ↔ C13  (sheet)
  - Y2 ↔ L14  (sheet)
  - Y2 ↔ I22  (sheet)
  - G4 ↔ C13  (sheet)
  - G4 ↔ L14  (sheet)
  - G4 ↔ I22  (sheet)
  - C13 ↔ I22  (sheet)
  - C13 ↔ Y28  (sheet)
  - C13 ↔ C30  (sheet)
  - C13 ↔ N31  (sheet)
  - L14 ↔ I22  (sheet)
  - … +16 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=25 · exposed=11 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=324 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=195 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=1.7718 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=22 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Disulfide Bonds Formed

- count=3: C5–C19, C13–C30, C32–C41

## Side-chain Rotamers (χ1/χ2)

- 45 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
