# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\1TIT\sequence\1TIT.pdb`
- output_pdb: `general_benchmark\gap_filling\control_noe\noe\1TIT\seeds\seed_1\1TIT.pdb`
- residues: 87
- mode: refinement
- ca_rmsd: 11.216 A
- tm_score_ca_ordered: 0.18530713761203024
- heavy_atom_rmsd: 12.255 A
- sidechain_heavy_atom_rmsd: 13.313 A
- **all-atom quality (honest):** heavy 12.255 A, sidechain 13.313 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/73 (0.0)
- lj_severe: 0
- lj_near: 76
- distogram_pairs: 118
- bin_accuracy: 0.271

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `STRUCTURAL_CONFLICT` (descriptive) — the fold cannot satisfy the restraints here (focal footprint); root_causes localize WHERE. Caveat: this is DESCRIPTIVE — it can reflect a genuine input defect OR a hard fold the engine did not fully converge (seen on clean L0 of large β-sheets), and register-shift/truncation/wrong-region are not blindly separable. Only INPUT_SELF_CONTRADICTORY is a pure input verdict; cross-check template length_ratio/coverage offline
- **root cause(s):** V70-Q73 → 41 conflicts (44%); A80-L83 → 19 conflicts (20%); H55 → 9 conflicts (10%)
- explained: 69/93 conflicts by 3 root cause(s)
- metrics: hubs=30 (frac 0.345), conflicts/hub=3.1, max_incompat=9.52Å, chain_span=0.943
- **fix-first:** [STRUCTURAL_CONFLICT] Root cause(s): V70-Q73 + A80-L83 + H55 — explain ~69/93 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **H55** — severity 16.18, 11 conflict(s); suspect input ~`G31` (group: pull_in)
  - pull-in (wants closer): I22@4.3Å(now 7.0,conf 0.41), E23@4.7Å(now 8.9,conf 0.37), L24@4.8Å(now 8.9,conf 0.36), G31@4.9Å(now 9.5,conf 0.35), F72@5.8Å(now 9.6,conf 0.23)
  - D51↔G31: targets 4.7/4.9Å but partners are 15.5Å apart → too_far_apart by 6.0Å
  - D51↔L24: targets 4.7/4.8Å but partners are 15.1Å apart → too_far_apart by 5.6Å
  - D51↔E23: targets 4.7/4.7Å but partners are 14.0Å apart → too_far_apart by 4.7Å
- **L7** — severity 15.34, 9 conflict(s); suspect input ~`E21` (group: pull_in)
  - pull-in (wants closer): A80@4.7Å(now 8.3,conf 0.37), E21@4.8Å(now 10.9,conf 0.36), S71@4.9Å(now 7.8,conf 0.35)
  - A80↔E21: targets 4.7/4.8Å but partners are 19.0Å apart → too_far_apart by 9.5Å
  - E21↔S71: targets 4.8/4.9Å but partners are 17.7Å apart → too_far_apart by 8.0Å
  - E21↔A81: targets 4.8/4.8Å but partners are 16.5Å apart → too_far_apart by 6.8Å
- **W33** — severity 13.74, 12 conflict(s); suspect input ~`E21` (group: pull_in)
  - pull-in (wants closer): Q73@4.7Å(now 7.4,conf 0.38), E21@4.9Å(now 9.5,conf 0.35), I48@5.2Å(now 8.4,conf 0.26), I56@5.2Å(now 10.7,conf 0.26), L57@5.2Å(now 8.4,conf 0.26)
  - Q73↔E21: targets 4.7/4.9Å but partners are 16.5Å apart → too_far_apart by 6.9Å
  - Q73↔I56: targets 4.7/5.2Å but partners are 16.5Å apart → too_far_apart by 6.7Å
  - F72↔E21: targets 3.8/4.9Å but partners are 12.8Å apart → too_far_apart by 4.1Å
- **F72** — severity 7.87, 6 conflict(s); suspect input ~`K34` (group: pull_in)
  - pull-in (wants closer): A80@4.3Å(now 9.3,conf 0.41), H55@5.8Å(now 9.6,conf 0.23)
  - A80↔K34: targets 4.3/4.5Å but partners are 14.5Å apart → too_far_apart by 5.8Å
  - W33↔A80: targets 3.8/4.3Å but partners are 12.3Å apart → too_far_apart by 4.2Å
  - A80↔L24: targets 4.3/5.1Å but partners are 14.5Å apart → too_far_apart by 5.2Å
- **F20** — severity 7.77, 6 conflict(s); suspect input ~`A81` (group: pull_in)
  - pull-in (wants closer): I58@4.5Å(now 7.5,conf 0.39), A81@4.7Å(now 9.7,conf 0.37), L83@5.4Å(now 9.2,conf 0.24)
  - I58↔A81: targets 4.5/4.7Å but partners are 15.1Å apart → too_far_apart by 5.9Å
  - L57↔A81: targets 4.3/4.7Å but partners are 14.2Å apart → too_far_apart by 5.2Å
  - I58↔L83: targets 4.5/5.4Å but partners are 14.9Å apart → too_far_apart by 5.0Å
- **V70** — severity 6.34, 6 conflict(s); suspect input ~`K34` (group: pull_in)
  - pull-in (wants closer): A81@4.1Å(now 7.4,conf 0.43), N82@4.2Å(now 9.5,conf 0.43)
  - L35↔N82: targets 4.0/4.2Å but partners are 12.0Å apart → too_far_apart by 3.8Å
  - N82↔K34: targets 4.2/5.1Å but partners are 14.9Å apart → too_far_apart by 5.6Å
  - N82↔W33: targets 4.2/5.1Å but partners are 12.8Å apart → too_far_apart by 3.5Å

## Secondary Structure (DSSP-like)

- helix(H)=63 · strand(E)=16 · 3-10(G)=6 · coil(C)=2

```
CEHEHEHEHHHHEHCGGEGHHHHHHHHHHGHEHHHEHEHHHHHHEGHHHHGHHEHHHHEHHHHHHHHHEHHHEHHHEHHHHHHHHHE
```

## Backbone H-bond Network

- total=70 · helix(i→i+4)=43 · sheet=27
  - V3 ↔ L7  (helix)
  - K5 ↔ G9  (helix)
  - V10 ↔ V14  (helix)
  - F20 ↔ L24  (helix)
  - E21 ↔ S25  (helix)
  - I22 ↔ E26  (helix)
  - E23 ↔ P27  (helix)
  - L24 ↔ D28  (helix)
  - S25 ↔ V29  (helix)
  - P27 ↔ G31  (helix)
  - V29 ↔ W33  (helix)
  - G31 ↔ L35  (helix)
  - W33 ↔ G37  (helix)
  - L35 ↔ P39  (helix)
  - G37 ↔ T41  (helix)
  - P39 ↔ S43  (helix)
  - L40 ↔ P44  (helix)
  - S43 ↔ E47  (helix)
  - P44 ↔ I48  (helix)
  - I48 ↔ G52  (helix)
  - … +50 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=27 · exposed=41 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=1056 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=763 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=2.3334 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=76 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 73 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
