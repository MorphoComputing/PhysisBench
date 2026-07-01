# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\2HIU\sequence\2HIU.pdb`
- output_pdb: `general_benchmark\gap_filling\noe+soi\2HIU\seeds\seed_3\2HIU.pdb`
- residues: 47
- mode: refinement
- ca_rmsd: 7.134 A
- tm_score_ca_ordered: 0.15589422155870608
- heavy_atom_rmsd: 8.417 A
- sidechain_heavy_atom_rmsd: 9.500 A
- **all-atom quality (honest):** heavy 8.417 A, sidechain 9.500 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 3/3
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/43 (0.0)
- lj_severe: 0
- lj_near: 14
- distogram_pairs: 220
- bin_accuracy: 0.414

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `STRUCTURAL_CONFLICT` (descriptive) — the fold cannot satisfy the restraints here (focal footprint); root_causes localize WHERE. Caveat: this is DESCRIPTIVE — it can reflect a genuine input defect OR a hard fold the engine did not fully converge (seen on clean L0 of large β-sheets), and register-shift/truncation/wrong-region are not blindly separable. Only INPUT_SELF_CONTRADICTORY is a pure input verdict; cross-check template length_ratio/coverage offline
- **root cause(s):** H23-C25 → 35 conflicts (66%); V20 → 5 conflicts (9%); H28 → 4 conflicts (8%)
- explained: 44/53 conflicts by 3 root cause(s)
- metrics: hubs=12 (frac 0.255), conflicts/hub=4.4, max_incompat=8.01Å, chain_span=0.979
- **fix-first:** [STRUCTURAL_CONFLICT] Root cause(s): H23-C25 + V20 + H28 — explain ~44/53 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **C25** — severity 11.39, 8 conflict(s); suspect input ~`Q22` (group: pull_in)
  - pull-in (wants closer): L29@7.2Å(now 11.6,conf 0.82), V30@9.2Å(now 14.2,conf 0.82), E31@10.8Å(now 16.2,conf 0.52), Y44@4.3Å(now 9.6,conf 0.41), C19@9.0Å(now 12.3,conf 0.40), N21@4.5Å(now 7.4,conf 0.39), Q22@4.5Å(now 8.3,conf 0.39), T45@4.5Å(now 8.6,conf 0.39)
  - Q22↔T45: targets 4.5/4.5Å but partners are 14.9Å apart → too_far_apart by 5.9Å
  - Y44↔Q22: targets 4.3/4.5Å but partners are 14.1Å apart → too_far_apart by 5.2Å
  - N21↔T45: targets 4.5/4.5Å but partners are 13.6Å apart → too_far_apart by 4.6Å
- **H28** — severity 10.69, 10 conflict(s); suspect input ~`F43` (group: pull_in)
  - pull-in (wants closer): F43@5.2Å(now 9.7,conf 0.26), F42@5.7Å(now 9.4,conf 0.23)
  - push-out (wants farther): A32@9.4Å(now 6.9,conf 0.52)
  - H23↔F43: targets 5.2/5.2Å but partners are 16.4Å apart → too_far_apart by 6.0Å
  - Q22↔F43: targets 8.0/5.2Å but partners are 18.4Å apart → too_far_apart by 5.2Å
  - L24↔F43: targets 4.5/5.2Å but partners are 14.7Å apart → too_far_apart by 5.0Å
- **K47** — severity 8.41, 3 conflict(s); suspect input ~`Y44` (group: push_out)
  - push-out (wants farther): I1@26.6Å(now 11.8,conf 0.84), Y44@9.6Å(now 7.0,conf 0.69)
  - I1↔Y44: targets 26.6/9.6Å but partners are 9.0Å apart → too_close_together by 8.0Å
  - I1↔F43: targets 26.6/11.1Å but partners are 13.0Å apart → too_close_together by 2.5Å
  - I1↔F42: targets 26.6/11.8Å but partners are 12.5Å apart → too_close_together by 2.3Å
- **I1** — severity 7.01, 4 conflict(s); suspect input ~`K47` (group: push_out)
  - push-out (wants farther): K47@26.6Å(now 11.8,conf 0.84), C6@16.5Å(now 12.4,conf 0.82), C5@14.2Å(now 10.9,conf 0.69), T7@17.0Å(now 13.9,conf 0.34), S8@17.0Å(now 13.7,conf 0.34)
  - Q4↔K47: targets 10.9/26.6Å but partners are 11.3Å apart → too_close_together by 4.4Å
  - K47↔C6: targets 26.6/16.5Å but partners are 8.3Å apart → too_close_together by 1.8Å
  - K47↔T7: targets 26.6/17.0Å but partners are 6.7Å apart → too_close_together by 2.9Å
- **C37** — severity 6.82, 5 conflict(s); suspect input ~`V20` (group: pull_in)
  - pull-in (wants closer): V20@4.9Å(now 11.3,conf 0.36)
  - push-out (wants farther): A32@6.9Å(now 3.8,conf 0.84), V30@7.6Å(now 4.5,conf 0.69)
  - G41↔V20: targets 8.4/4.9Å but partners are 18.1Å apart → too_far_apart by 4.9Å
  - R40↔V20: targets 8.4/4.9Å but partners are 18.0Å apart → too_far_apart by 4.8Å
  - Y34↔V20: targets 4.1/4.9Å but partners are 13.3Å apart → too_far_apart by 4.3Å
- **L24** — severity 6.50, 5 conflict(s); suspect input ~`T45` (group: push_out)
  - pull-in (wants closer): V20@6.1Å(now 8.7,conf 0.49), T45@4.5Å(now 10.8,conf 0.39)
  - push-out (wants farther): N17@13.2Å(now 9.9,conf 0.52)
  - N17↔V20: targets 13.2/6.1Å but partners are 2.0Å apart → too_close_together by 5.1Å
  - N21↔N17: targets 6.7/13.2Å but partners are 3.8Å apart → too_close_together by 2.7Å
  - L29↔T45: targets 4.3/4.5Å but partners are 11.6Å apart → too_far_apart by 2.7Å

## Secondary Structure (DSSP-like)

- helix(H)=29 · strand(E)=14 · 3-10(G)=2 · coil(C)=2

```
CHEHHGGECEHHHEEEHHHEHEEHHHHHHHHHHHHHHEHEHEHEHHE
```

## Backbone H-bond Network

- total=34 · helix(i→i+4)=12 · sheet=22
  - Y13 ↔ N17  (helix)
  - N17 ↔ N21  (helix)
  - N21 ↔ C25  (helix)
  - G26 ↔ V30  (helix)
  - S27 ↔ E31  (helix)
  - H28 ↔ A32  (helix)
  - V30 ↔ Y34  (helix)
  - E31 ↔ L35  (helix)
  - A32 ↔ V36  (helix)
  - L33 ↔ C37  (helix)
  - L35 ↔ E39  (helix)
  - E39 ↔ F43  (helix)
  - E3 ↔ S8  (sheet)
  - E3 ↔ C10  (sheet)
  - E3 ↔ Q14  (sheet)
  - E3 ↔ L15  (sheet)
  - E3 ↔ E16  (sheet)
  - E3 ↔ V20  (sheet)
  - E3 ↔ Q22  (sheet)
  - E3 ↔ H23  (sheet)
  - … +14 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=14 · exposed=17 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=234 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=145 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=4.6003 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=14 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Disulfide Bonds Formed

- count=3: C5–C10, C6–C25, C19–C37

## Side-chain Rotamers (χ1/χ2)

- 43 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
